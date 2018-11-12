program fci_zmq
  implicit none
  integer                        :: i,j,k
  double precision, allocatable  :: pt2(:), variance(:), norm(:)
  integer                        :: n_det_before, to_select
  double precision               :: threshold_davidson_in
  
  allocate (pt2(N_states), norm(N_states), variance(N_states))

  double precision               :: hf_energy_ref
  logical                        :: has
  double precision               :: relative_error

  relative_error=PT2_relative_error

  pt2 = -huge(1.e0)
  norm = 0.d0
  variance = 0.d0
  threshold_davidson_in = threshold_davidson
  threshold_davidson = threshold_davidson_in * 100.d0
  SOFT_TOUCH threshold_davidson

!  if (N_det < N_states) then
    call diagonalize_CI
    call save_wavefunction
!  endif
  
  call ezfio_has_hartree_fock_energy(has)
  if (has) then
    call ezfio_get_hartree_fock_energy(hf_energy_ref)
  else
    hf_energy_ref = ref_bitmask_energy
  endif

  if (N_det > N_det_max) then
    psi_det = psi_det_sorted
    psi_coef = psi_coef_sorted
    N_det = N_det_max
    soft_touch N_det psi_det psi_coef
    call diagonalize_CI
    call save_wavefunction
  endif
  
  n_det_before = 0

  double precision :: correlation_energy_ratio
  double precision :: threshold_selectors_save, threshold_generators_save
  threshold_selectors_save  = threshold_selectors
  threshold_generators_save = threshold_generators
  double precision :: error(N_states)

  correlation_energy_ratio = 0.d0

    do while (                                                         &
          (N_det < N_det_max) .and.                                    &
          (maxval(abs(pt2(1:N_states))) > pt2_max) .and.               &
          (correlation_energy_ratio <= correlation_energy_ratio_max)    &
          )
       write(*,'(A)')  '--------------------------------------------------------------------------------'


      if (do_pt2) then
        pt2 = 0.d0
        variance = 0.d0
        norm = 0.d0
        threshold_selectors = 1.d0
        threshold_generators = 1.d0 
        SOFT_TOUCH threshold_selectors threshold_generators
        call ZMQ_pt2(psi_energy_with_nucl_rep,pt2,relative_error,error, variance, norm) ! Stochastic PT2
        threshold_selectors = threshold_selectors_save
        threshold_generators = threshold_generators_save
        SOFT_TOUCH threshold_selectors threshold_generators
      endif


      correlation_energy_ratio = (psi_energy_with_nucl_rep(1) - hf_energy_ref)  /     &
                      (psi_energy_with_nucl_rep(1) + pt2(1) - hf_energy_ref)
      correlation_energy_ratio = min(1.d0,correlation_energy_ratio)

      call ezfio_set_fci_energy_pt2(psi_energy_with_nucl_rep+pt2)
      call write_double(6,correlation_energy_ratio, 'Correlation ratio')
      call print_summary(psi_energy_with_nucl_rep(1:N_states),pt2,error,variance,norm)
      call save_iterations(psi_energy_with_nucl_rep(1:N_states),pt2,N_det) 
      call print_extrapolated_energy(psi_energy_with_nucl_rep(1:N_states),pt2)
      N_iter += 1

      n_det_before = N_det
      if (s2_eig) then
        to_select = N_det/2+1
        to_select = max(N_det/2+1, to_select)
        to_select = min(to_select, N_det_max-n_det_before)
      else
        to_select = N_det
        to_select = max(N_det, to_select)
        to_select = min(to_select, N_det_max-n_det_before)
      endif
      call ZMQ_selection(to_select, pt2, variance, norm)
      
      PROVIDE  psi_coef
      PROVIDE  psi_det
      PROVIDE  psi_det_sorted

      if (N_det >= N_det_max) then
        threshold_davidson = threshold_davidson_in
      end if
      call diagonalize_CI
      call save_wavefunction
      call ezfio_set_fci_energy(psi_energy_with_nucl_rep(1:N_states))
    enddo

  if (N_det < N_det_max) then
      threshold_davidson = threshold_davidson_in
      call diagonalize_CI
      call save_wavefunction
      call ezfio_set_fci_energy(psi_energy_with_nucl_rep(1:N_states))
      call ezfio_set_fci_energy_pt2(psi_energy_with_nucl_rep(1:N_states)+pt2)
  endif

  if (do_pt2) then
    pt2 = 0.d0
    variance = 0.d0
    norm = 0.d0
    threshold_selectors = 1.d0
    threshold_generators = 1d0 
    SOFT_TOUCH threshold_selectors threshold_generators
    call ZMQ_pt2(psi_energy_with_nucl_rep, pt2,relative_error,error,variance,norm) ! Stochastic PT2
    threshold_selectors = threshold_selectors_save
    threshold_generators = threshold_generators_save
    SOFT_TOUCH threshold_selectors threshold_generators
    call ezfio_set_fci_energy(psi_energy_with_nucl_rep(1:N_states))
    call ezfio_set_fci_energy_pt2(psi_energy_with_nucl_rep(1:N_states)+pt2)
  endif
  print *,  'N_det             = ', N_det
  print *,  'N_states          = ', N_states
  print*,   'correlation_ratio = ', correlation_energy_ratio


  call save_iterations(psi_energy_with_nucl_rep(1:N_states),pt2,N_det) 
  call write_double(6,correlation_energy_ratio, 'Correlation ratio')
  call print_summary(psi_energy_with_nucl_rep(1:N_states),pt2,error,variance,norm)

end
