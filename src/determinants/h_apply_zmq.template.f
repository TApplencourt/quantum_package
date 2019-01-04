subroutine $subroutine($params_main)
  implicit none
  use omp_lib
  use bitmasks
  use f77_zmq
  BEGIN_DOC
  ! Calls H_apply on the |HF| determinant and selects all connected single and double
  ! excitations (of the same symmetry). Auto-generated by the :file:`generate_h_apply` script.
  END_DOC
  
  $decls_main
  
  integer                        :: i
  integer                        :: i_generator
  double precision               :: wall_0, wall_1
  integer(bit_kind), allocatable :: mask(:,:,:)
  integer                        :: ispin, k
  integer                        :: rc
  character*(512)                :: task
  double precision, allocatable  :: fock_diag_tmp(:,:)

  $initialization
  PROVIDE H_apply_buffer_allocated mo_bielec_integrals_in_map psi_det_generators psi_coef_generators

  integer(ZMQ_PTR), external     :: new_zmq_pair_socket
  integer(ZMQ_PTR)               :: zmq_socket_pair, zmq_socket_pull

  integer(ZMQ_PTR) :: zmq_to_qp_run_socket
  double precision, allocatable :: pt2_generators(:,:), norm_pert_generators(:,:)
  double precision, allocatable :: H_pert_diag_generators(:,:)
  double precision              :: energy(N_st)

  call new_parallel_job(zmq_to_qp_run_socket,zmq_socket_pull,'$subroutine')
  zmq_socket_pair = new_zmq_pair_socket(.True.)

  integer, external              :: zmq_put_psi
  integer, external              :: zmq_put_N_det_generators
  integer, external              :: zmq_put_N_det_selectors
  integer, external              :: zmq_put_dvector
  
  if (zmq_put_psi(zmq_to_qp_run_socket,1) == -1) then
    stop 'Unable to put psi on ZMQ server'
  endif
  if (zmq_put_N_det_generators(zmq_to_qp_run_socket, 1) == -1) then
    stop 'Unable to put N_det_generators on ZMQ server'
  endif
  if (zmq_put_N_det_selectors(zmq_to_qp_run_socket, 1) == -1) then
    stop 'Unable to put N_det_selectors on ZMQ server'
  endif
  if (zmq_put_dvector(zmq_to_qp_run_socket,1,'energy',energy,size(energy)) == -1) then
    stop 'Unable to put energy on ZMQ server'
  endif

  do i_generator=1,N_det_generators
    $skip
    write(task,*) i_generator
    integer, external :: add_task_to_taskserver
    if (add_task_to_taskserver(zmq_to_qp_run_socket,trim(task)) == -1) then
      stop 'Unable to add task to taskserver'
    endif
  enddo

  allocate ( pt2_generators(N_states,N_det_generators), &
       norm_pert_generators(N_states,N_det_generators), &
     H_pert_diag_generators(N_states,N_det_generators) )

  PROVIDE nproc N_states
  !$OMP PARALLEL DEFAULT(NONE) &
  !$OMP PRIVATE(i) & 
  !$OMP SHARED(zmq_socket_pair,N_states, pt2_generators, norm_pert_generators, H_pert_diag_generators, n, task_id, i_generator,zmq_socket_pull)  & 
  !$OMP num_threads(nproc+1)
      i = omp_get_thread_num()
      if (i == 0) then
        call  $subroutine_collector(zmq_socket_pull)
        integer :: n, task_id
        call pull_pt2(zmq_socket_pair, pt2_generators, norm_pert_generators, H_pert_diag_generators, i_generator, size(pt2_generators), n, task_id)
      else
        call $subroutine_slave_inproc(i)
      endif
  !$OMP END PARALLEL


  call end_zmq_pair_socket(zmq_socket_pair)
  call end_parallel_job(zmq_to_qp_run_socket,zmq_socket_pull,'$subroutine')


  $copy_buffer
  $generate_psi_guess

  deallocate ( pt2_generators, norm_pert_generators, H_pert_diag_generators)
end

subroutine $subroutine_slave_tcp(iproc)
  implicit none
  integer, intent(in) :: iproc
  BEGIN_DOC
! Computes a buffer over the network
  END_DOC
  call $subroutine_slave(0,iproc)
end

subroutine $subroutine_slave_inproc(iproc)
  implicit none
  integer, intent(in) :: iproc
  BEGIN_DOC
! Computes a buffer using threads
  END_DOC
  call $subroutine_slave(1,iproc)
end


subroutine $subroutine_slave(thread, iproc)
  implicit none
  use omp_lib
  use bitmasks
  use f77_zmq
  integer, intent(in)            :: thread
  BEGIN_DOC
  ! Calls H_apply on the HF determinant and selects all connected single and double
  ! excitations (of the same symmetry). Auto-generated by the :file:`generate_h_apply` script.
  END_DOC
  
  integer, intent(in)            :: iproc
  integer                        :: i_generator
  double precision               :: wall_0, wall_1
  integer(bit_kind), allocatable :: mask(:,:,:)
  integer                        :: ispin, k
  double precision, allocatable  :: fock_diag_tmp(:,:)
  double precision, allocatable  :: pt2(:), norm_pert(:), H_pert_diag(:)

  integer                        :: worker_id, task_id, rc, N_st
  character*(512)                :: task
  integer(ZMQ_PTR),external      :: new_zmq_to_qp_run_socket
  integer(ZMQ_PTR)               :: zmq_to_qp_run_socket
  integer(ZMQ_PTR),external      :: new_zmq_push_socket
  integer(ZMQ_PTR)               :: zmq_socket_push

  zmq_to_qp_run_socket = new_zmq_to_qp_run_socket()

  integer, external              :: connect_to_taskserver
  if (connect_to_taskserver(zmq_to_qp_run_socket,worker_id,thread) == -1) then
    call end_zmq_to_qp_run_socket(zmq_to_qp_run_socket)
    return
  endif
  
  zmq_socket_push = new_zmq_push_socket(thread) 

  N_st = N_states
  allocate( pt2(N_st), norm_pert(N_st), H_pert_diag(N_st), &
            mask(N_int,2,6), fock_diag_tmp(2,mo_tot_num+1) )

  do
    integer, external :: get_task_from_taskserver
    if (get_task_from_taskserver(zmq_to_qp_run_socket,worker_id, task_id, task) == -1) then
      exit
    endif
    if (task_id == 0) exit
    read(task,*) i_generator

    ! Compute diagonal of the Fock matrix
    call build_fock_tmp(fock_diag_tmp,psi_det_generators(1,1,i_generator),N_int)

    pt2 = 0.d0
    norm_pert = 0.d0
    H_pert_diag = 0.d0 

    ! Create bit masks for holes and particles
    do ispin=1,2
      do k=1,N_int
        mask(k,ispin,s_hole) =                                      &
            iand(generators_bitmask(k,ispin,s_hole,i_bitmask_gen),  &
            psi_det_generators(k,ispin,i_generator) )
        mask(k,ispin,s_part) =                                      &
            iand(generators_bitmask(k,ispin,s_part,i_bitmask_gen),  &
            not(psi_det_generators(k,ispin,i_generator)) )
        mask(k,ispin,d_hole1) =                                      &
            iand(generators_bitmask(k,ispin,d_hole1,i_bitmask_gen),  &
            psi_det_generators(k,ispin,i_generator) )
        mask(k,ispin,d_part1) =                                      &
            iand(generators_bitmask(k,ispin,d_part1,i_bitmask_gen),  &
            not(psi_det_generators(k,ispin,i_generator)) )
        mask(k,ispin,d_hole2) =                                      &
            iand(generators_bitmask(k,ispin,d_hole2,i_bitmask_gen),  &
            psi_det_generators(k,ispin,i_generator) )
        mask(k,ispin,d_part2) =                                      &
            iand(generators_bitmask(k,ispin,d_part2,i_bitmask_gen),  &
            not (psi_det_generators(k,ispin,i_generator)) )
      enddo
    enddo

    if($do_double_excitations)then
      call $subroutine_diexc(psi_det_generators(1,1,i_generator),    &
        psi_det_generators(1,1,1),                                   &
        mask(1,1,d_hole1), mask(1,1,d_part1),                        &
        mask(1,1,d_hole2), mask(1,1,d_part2),                        &
        fock_diag_tmp, i_generator, iproc $params_post)
    endif
    if($do_mono_excitations)then
      call $subroutine_monoexc(psi_det_generators(1,1,i_generator),  &
        mask(1,1,s_hole ), mask(1,1,s_part ),                        &
        fock_diag_tmp, i_generator, iproc $params_post)
    endif

    integer, external :: task_done_to_taskserver
    if (task_done_to_taskserver(zmq_to_qp_run_socket, worker_id, task_id) == -1) then
        print *,  irp_here, ': Unable to send task_done'
    endif
    call push_pt2(zmq_socket_push,pt2,norm_pert,H_pert_diag,i_generator,N_st,task_id)

  enddo
  
  deallocate( mask, fock_diag_tmp, pt2, norm_pert, H_pert_diag )


  integer, external              :: disconnect_from_taskserver
  if (disconnect_from_taskserver(zmq_to_qp_run_socket,worker_id) == -1) then
    continue
  endif
  call end_zmq_push_socket(zmq_socket_push,thread)
  call end_zmq_to_qp_run_socket(zmq_to_qp_run_socket)

end

subroutine $subroutine_collector(zmq_socket_pull)
  use f77_zmq
  implicit none
  BEGIN_DOC
! Collects results from the selection in an array of generators
  END_DOC

  integer :: k, rc

  integer(ZMQ_PTR), external     :: new_zmq_pull_socket
  integer(ZMQ_PTR), intent(in)   :: zmq_socket_pull
  integer*8                      :: control, accu
  integer                        :: n, more, task_id, i_generator

  integer(ZMQ_PTR),external      :: new_zmq_to_qp_run_socket
  integer(ZMQ_PTR)               :: zmq_to_qp_run_socket

  zmq_to_qp_run_socket = new_zmq_to_qp_run_socket()

  double precision, allocatable :: pt2(:), norm_pert(:), H_pert_diag(:)
  double precision, allocatable :: pt2_result(:,:), norm_pert_result(:,:), H_pert_diag_result(:,:)
  allocate (pt2(N_states), norm_pert(N_states), H_pert_diag(N_states))
  allocate (pt2_result(N_states,N_det_generators), norm_pert_result(N_states,N_det_generators), &
            H_pert_diag_result(N_states,N_det_generators))

  pt2_result = 0.d0
  norm_pert_result = 0.d0
  H_pert_diag_result = 0.d0
  accu = 0_8
  more = 1
  do while (more == 1)

    call pull_pt2(zmq_socket_pull, pt2, norm_pert, H_pert_diag, i_generator, N_states, n, task_id)
    if (n > 0) then
      do k=1,N_states
        pt2_result(k,i_generator) = pt2(k)
        norm_pert_result(k,i_generator) = norm_pert(k)
        H_pert_diag_result(k,i_generator) = H_pert_diag(k)
      enddo
      accu = accu + 1_8
      integer, external :: zmq_delete_task
      if (zmq_delete_task(zmq_to_qp_run_socket,zmq_socket_pull,task_id,more) == -1) then
        stop 'Unable to delete task'
      endif
    endif

  enddo

  call end_zmq_to_qp_run_socket(zmq_to_qp_run_socket)


  integer(ZMQ_PTR), external     :: new_zmq_pair_socket
  integer(ZMQ_PTR)               :: socket_result

  socket_result = new_zmq_pair_socket(.False.)

  call push_pt2(socket_result, pt2_result, norm_pert_result, H_pert_diag_result, i_generator, &
     N_states*N_det_generators,0)

  deallocate (pt2, norm_pert, H_pert_diag, pt2_result, norm_pert_result, H_pert_diag_result)

  call end_zmq_pair_socket(socket_result)

end


