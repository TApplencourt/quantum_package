program cis
  implicit none
  BEGIN_DOC
  ! Configuration Interaction with Single excitations.
  ! 
  ! This program takes a reference Slater determinant of ROHF-like occupancy, 
  ! 
  ! and performs all single excitations on top of it, disregarding spatial symmetry and compute the "n_states" lowest eigenstates of that CI matrix. (see :option:`determinants n_states`)
  ! 
  ! This program can be useful in many cases: 
  !
  ! * GROUND STATE CALCULATION: to be sure to have the lowest scf solution, perform an scf (see the :ref:`hartree_fock` module), then a cis, 
  ! 
  !   save the natural orbitals (see :ref:`save_natorb`) and reperform an scf optimization from this MO guess
  !
  !
  !
  ! * EXCITED STATES CALCULATIONS: the lowest excited states are much likely to be dominanted by single-excitations. 
  ! 
  !   Therefore, running a cis will save the "n_states" lowest states within the CIS space 
  !
  !   in the EZFIO folder, which can afterward be used as guess wave functions for a further 
  
  ! 
  !   multi-state fci calculation if you specify "read_wf" = True before running the fci executable. 
  !
  !   Also, if you specify "s2_eig" = True, the cis will only retain states having the good value :math:`S^2` value (see expected_s2). 
  !
  !   If "s2_eig" = False, it will take the lowest n_states, whatever multiplicity they are. 
  !
  !
  !
  !   Note: if you would like to discard some orbitals, use qp_set_mo_class to specify: 
  !
  !   * "core" orbitals which will be always doubly occupied
  ! 
  !   * "act" orbitals where an electron can be either excited from or to
  !
  !   * "del" orbitals which will be never occupied 
  END_DOC
  read_wf = .False.
  SOFT_TOUCH read_wf
  call run
end

subroutine run
  implicit none
  integer                        :: i
  
  call H_apply_cis
  print *,  'N_det = ', N_det
  print*,'******************************'
  print *,  'Energies  of the states:'
  do i = 1,N_states
    print *,  i, CI_energy(i)
  enddo
  if (N_states > 1) then
    print*,'******************************'
    print*,'Excitation energies '
    do i = 2, N_states
      print*, i ,CI_energy(i) - CI_energy(1)
    enddo
  endif
  
  call ezfio_set_cis_energy(CI_energy)
  psi_coef = ci_eigenvectors
  SOFT_TOUCH psi_coef
  call save_wavefunction
  
end
