program fci
  implicit none
  BEGIN_DOC
! Selected Full Configuration Interaction with stochastic selection and PT2.
! 
! This program performs a CIPSI-like selected CI using a stochastic scheme for both 
!
! the selection of the important Slater determinants and the computation of the PT2 correction. 
!
! This CIPSI-like algorithm will be performed for the "n_states" lowest states of the variational space (see :option:`determinants n_det_max`)
!
! The fci program will stop when reaching at least one the two following conditions:  
!
! * number of Slater determinant > "n_det_max" (see :option:`determinants n_det_max`)
!
! * |PT2| < "pt2_max" (see :option:`perturbation pt2_max`) 
!
!
! The following other options can be of interest: 
!
! If "read_wf" = False, it starts with a ROHF-like Slater determinant as a guess wave function. 
!
! If "read_wf" = True , it starts with the wave function(s) stored in the EZFIO folder as guess wave function(s). 
!
! (see :option:`determinants read_wf`)
!
! If "s2_eig" = True, it will systematically add all necessary Slater determinants in order 
! 
! to have a pure spin wave function with an :math:`S^2` value corresponding to "expected_s2". 
!
! (see :option:`determinants s2_eig` and :option:`determinants expected_s2`)
!
! 
!
!
! For excited states calculations, it is recommended to start with a cis or cisd guess wave functions 
!
! for the "n_states", and to set "s2_eig" = True. 
  END_DOC

  if (.not.is_zmq_slave) then

    if (do_pt2) then
      call run_stochastic_cipsi
    else
      call run_cipsi
    endif

  else

    call run_slave_cipsi

  endif
end
