.. _davidson:

.. program:: davidson

.. default-role:: option

========
davidson
========

Abstract module for Davidson's diagonalization.
It contains everything required for the Davidson algorithm, dressed or not. If
a dressing is used, the dressing column should be defined and the
:ref:`davidson_dressed` module should be used. If no dressing is required,
the :ref:`davidson` module should be used, and it has a default zero dressing vector.

The important providers for that module are:

# `psi_energy` which is the expectation value over the wave function (`psi_det`, `psi_coef`) of the Hamiltonian, dressed or not. It uses the general subroutine `u_0_H_u_0`. 
# `psi_energy_two_e` which is the expectation value over the wave function (`psi_det`, `psi_coef`) of the standard two-electrons coulomb operator. It uses the general routine `u_0_H_u_0_two_e`. 



EZFIO parameters
----------------

.. option:: threshold_davidson

    Thresholds of Davidson's algorithm

    Default: 1.e-10

.. option:: n_states_diag

    Number of states to consider during the Davdison diagonalization

    Default: 4

.. option:: davidson_sze_max

    Number of micro-iterations before re-contracting

    Default: 8

.. option:: state_following

    If |true|, the states are re-ordered to match the input states

    Default: False

.. option:: disk_based_davidson

    If |true|, disk space is used to store the vectors

    Default: False

.. option:: distributed_davidson

    If |true|, use the distributed algorithm

    Default: True

.. option:: only_expected_s2

    If |true|, use filter out all vectors with bad |S^2| values

    Default: True


Providers
---------


.. c:var:: ci_eigenvectors

    .. code:: text

        double precision, allocatable	:: ci_electronic_energy	(N_states_diag)
        double precision, allocatable	:: ci_eigenvectors	(N_det,N_states_diag)
        double precision, allocatable	:: ci_eigenvectors_s2	(N_states_diag)

    File: :file:`diagonalize_ci.irp.f`

    Eigenvectors/values of the |CI| matrix




.. c:var:: ci_eigenvectors_s2

    .. code:: text

        double precision, allocatable	:: ci_electronic_energy	(N_states_diag)
        double precision, allocatable	:: ci_eigenvectors	(N_det,N_states_diag)
        double precision, allocatable	:: ci_eigenvectors_s2	(N_states_diag)

    File: :file:`diagonalize_ci.irp.f`

    Eigenvectors/values of the |CI| matrix




.. c:var:: ci_electronic_energy

    .. code:: text

        double precision, allocatable	:: ci_electronic_energy	(N_states_diag)
        double precision, allocatable	:: ci_eigenvectors	(N_det,N_states_diag)
        double precision, allocatable	:: ci_eigenvectors_s2	(N_states_diag)

    File: :file:`diagonalize_ci.irp.f`

    Eigenvectors/values of the |CI| matrix




.. c:var:: ci_energy

    .. code:: text

        double precision, allocatable	:: ci_energy	(N_states_diag)

    File: :file:`diagonalize_ci.irp.f`

    :c:data:`n_states` lowest eigenvalues of the |CI| matrix




.. c:var:: davidson_criterion

    .. code:: text

        character(64)	:: davidson_criterion

    File: :file:`parameters.irp.f`

    Can be : [  energy  | residual | both | wall_time | cpu_time | iterations ]




.. c:var:: dressed_column_idx

    .. code:: text

        integer, allocatable	:: dressed_column_idx	(N_states)

    File: :file:`diagonalization_hs2_dressed.irp.f`

    Index of the dressed columns




.. c:var:: n_states_diag

    .. code:: text

        integer	:: n_states_diag

    File: :file:`input.irp.f`

    Number of states to consider during the Davdison diagonalization




.. c:var:: nthreads_davidson

    .. code:: text

        integer	:: nthreads_davidson

    File: :file:`davidson_parallel.irp.f`

    Number of threads for Davidson




.. c:var:: psi_energy

    .. code:: text

        double precision, allocatable	:: psi_energy	(N_states)

    File: :file:`u0_h_u0.irp.f`

    Electronic energy of the current wave function




.. c:var:: psi_energy_two_e

    .. code:: text

        double precision, allocatable	:: psi_energy_two_e	(N_states)

    File: :file:`u0_wee_u0.irp.f`

    Energy of the current wave function




.. c:var:: psi_energy_with_nucl_rep

    .. code:: text

        double precision, allocatable	:: psi_energy_with_nucl_rep	(N_states)

    File: :file:`u0_h_u0.irp.f`

    Energy of the wave function with the nuclear repulsion energy.




Subroutines / functions
-----------------------



.. c:function:: davidson_collector

    .. code:: text

        subroutine davidson_collector(zmq_to_qp_run_socket, zmq_socket_pull, v0, s0, sze, N_st)

    File: :file:`davidson_parallel.irp.f`

    Routine collecting the results of the workers in Davidson's algorithm.





.. c:function:: davidson_converged

    .. code:: text

        subroutine davidson_converged(energy,residual,wall,iterations,cpu,N_st,converged)

    File: :file:`parameters.irp.f`

    True if the Davidson algorithm is converged





.. c:function:: davidson_diag_hjj_sjj

    .. code:: text

        subroutine davidson_diag_hjj_sjj(dets_in,u_in,H_jj,s2_out,energies,dim_in,sze,N_st,N_st_diag,Nint,dressing_state,converged)

    File: :file:`diagonalization_hs2_dressed.irp.f`

    Davidson diagonalization with specific diagonal elements of the H matrix 

    H_jj : specific diagonal H matrix elements to diagonalize de Davidson 

    S2_out : Output : s^2 

    dets_in : bitmasks corresponding to determinants 

    u_in : guess coefficients on the various states. Overwritten on exit 

    dim_in : leftmost dimension of u_in 

    sze : Number of determinants 

    N_st : Number of eigenstates 

    N_st_diag : Number of states in which H is diagonalized. Assumed > sze 

    Initial guess vectors are not necessarily orthonormal





.. c:function:: davidson_diag_hs2

    .. code:: text

        subroutine davidson_diag_hs2(dets_in,u_in,s2_out,dim_in,energies,sze,N_st,N_st_diag,Nint,dressing_state,converged)

    File: :file:`diagonalization_hs2_dressed.irp.f`

    Davidson diagonalization. 

    dets_in : bitmasks corresponding to determinants 

    u_in : guess coefficients on the various states. Overwritten on exit 

    dim_in : leftmost dimension of u_in 

    sze : Number of determinants 

    N_st : Number of eigenstates 

    Initial guess vectors are not necessarily orthonormal





.. c:function:: davidson_pull_results

    .. code:: text

        subroutine davidson_pull_results(zmq_socket_pull, v_t, s_t, imin, imax, task_id)

    File: :file:`davidson_parallel.irp.f`

    Pull the results of  :math:`H|U \rangle`  on the master.





.. c:function:: davidson_push_results

    .. code:: text

        subroutine davidson_push_results(zmq_socket_push, v_t, s_t, imin, imax, task_id)

    File: :file:`davidson_parallel.irp.f`

    Push the results of  :math:`H|U \rangle`  from a worker to the master.





.. c:function:: davidson_run_slave

    .. code:: text

        subroutine davidson_run_slave(thread,iproc)

    File: :file:`davidson_parallel.irp.f`

    Slave routine for Davidson's diagonalization.





.. c:function:: davidson_slave_inproc

    .. code:: text

        subroutine davidson_slave_inproc(i)

    File: :file:`davidson_parallel.irp.f`

    





.. c:function:: davidson_slave_tcp

    .. code:: text

        subroutine davidson_slave_tcp(i)

    File: :file:`davidson_parallel.irp.f`

    





.. c:function:: davidson_slave_work

    .. code:: text

        subroutine davidson_slave_work(zmq_to_qp_run_socket, zmq_socket_push, N_st, sze, worker_id)

    File: :file:`davidson_parallel.irp.f`

    





.. c:function:: diagonalize_ci

    .. code:: text

        subroutine diagonalize_CI

    File: :file:`diagonalize_ci.irp.f`

    Replace the coefficients of the |CI| states by the coefficients of the eigenstates of the |CI| matrix.





.. c:function:: h_s2_u_0_nstates_openmp

    .. code:: text

        subroutine H_S2_u_0_nstates_openmp(v_0,s_0,u_0,N_st,sze)

    File: :file:`u0_h_u0.irp.f`

    Computes  :math:`v_0 = H|u_0\rangle`  and  :math:`s_0 = S^2 |u_0\rangle` . 

    Assumes that the determinants are in psi_det 

    istart, iend, ishift, istep are used in ZMQ parallelization.





.. c:function:: h_s2_u_0_nstates_openmp_work

    .. code:: text

        subroutine H_S2_u_0_nstates_openmp_work(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_h_u0.irp.f`

    Computes  :math:`v_t = H|u_t\rangle`  and  :math:`s_t = S^2 |u_t\rangle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_nstates_openmp_work_1

    .. code:: text

        subroutine H_S2_u_0_nstates_openmp_work_1(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_h_u0.irp.f_template_477`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_nstates_openmp_work_2

    .. code:: text

        subroutine H_S2_u_0_nstates_openmp_work_2(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_h_u0.irp.f_template_477`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_nstates_openmp_work_3

    .. code:: text

        subroutine H_S2_u_0_nstates_openmp_work_3(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_h_u0.irp.f_template_477`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_nstates_openmp_work_4

    .. code:: text

        subroutine H_S2_u_0_nstates_openmp_work_4(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_h_u0.irp.f_template_477`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_nstates_openmp_work_n_int

    .. code:: text

        subroutine H_S2_u_0_nstates_openmp_work_N_int(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_h_u0.irp.f_template_477`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_nstates_zmq

    .. code:: text

        subroutine H_S2_u_0_nstates_zmq(v_0,s_0,u_0,N_st,sze)

    File: :file:`davidson_parallel.irp.f`

    Computes  :math:`v_0 = H|u_0\rangle`  and  :math:`s_0 = S^2 |u_0\rangle` 

    n : number of determinants 

    H_jj : array of  :math:`\langle j|H|j \rangle` 

    S2_jj : array of  :math:`\langle j|S^2|j \rangle`





.. c:function:: h_s2_u_0_two_e_nstates_openmp

    .. code:: text

        subroutine H_S2_u_0_two_e_nstates_openmp(v_0,s_0,u_0,N_st,sze)

    File: :file:`u0_wee_u0.irp.f`

    Computes  :math:`v_0 = H|u_0\rangle`  and  :math:`s_0 = S^2 |u_0\rangle` 

    Assumes that the determinants are in psi_det 

    istart, iend, ishift, istep are used in ZMQ parallelization.





.. c:function:: h_s2_u_0_two_e_nstates_openmp_work

    .. code:: text

        subroutine H_S2_u_0_two_e_nstates_openmp_work(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_wee_u0.irp.f`

    Computes  :math:`v_t = H|u_t\rangle`  and  :math:`s_t = S^2 |u_t\rangle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_two_e_nstates_openmp_work_1

    .. code:: text

        subroutine H_S2_u_0_two_e_nstates_openmp_work_1(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_wee_u0.irp.f_template_457`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_two_e_nstates_openmp_work_2

    .. code:: text

        subroutine H_S2_u_0_two_e_nstates_openmp_work_2(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_wee_u0.irp.f_template_457`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_two_e_nstates_openmp_work_3

    .. code:: text

        subroutine H_S2_u_0_two_e_nstates_openmp_work_3(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_wee_u0.irp.f_template_457`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_two_e_nstates_openmp_work_4

    .. code:: text

        subroutine H_S2_u_0_two_e_nstates_openmp_work_4(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_wee_u0.irp.f_template_457`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: h_s2_u_0_two_e_nstates_openmp_work_n_int

    .. code:: text

        subroutine H_S2_u_0_two_e_nstates_openmp_work_N_int(v_t,s_t,u_t,N_st,sze,istart,iend,ishift,istep)

    File: :file:`u0_wee_u0.irp.f_template_457`

    Computes  :math:`v_t = H|u_t angle`  and  :math:`s_t = S^2 |u_t angle` 

    Default should be 1,N_det,0,1





.. c:function:: u_0_h_u_0

    .. code:: text

        subroutine u_0_H_u_0(e_0,u_0,n,keys_tmp,Nint,N_st,sze)

    File: :file:`u0_h_u0.irp.f`

    Computes  :math:`E_0 = \frac{\langle u_0|H|u_0 \rangle}{\langle u_0|u_0 \rangle}` 

    n : number of determinants 







.. c:function:: u_0_h_u_0_two_e

    .. code:: text

        subroutine u_0_H_u_0_two_e(e_0,u_0,n,keys_tmp,Nint,N_st,sze)

    File: :file:`u0_wee_u0.irp.f`

    Computes  :math:`E_0 = \frac{ \langle u_0|H|u_0\rangle}{\langle u_0|u_0 \rangle}` . 

    n : number of determinants 







.. c:function:: zmq_get_n_states_diag

    .. code:: text

        integer function zmq_get_N_states_diag(zmq_to_qp_run_socket, worker_id)

    File: :file:`davidson_parallel.irp.f`

    Get N_states_diag from the qp_run scheduler





.. c:function:: zmq_put_n_states_diag

    .. code:: text

        integer function zmq_put_N_states_diag(zmq_to_qp_run_socket,worker_id)

    File: :file:`davidson_parallel.irp.f`

    Put N_states_diag on the qp_run scheduler


