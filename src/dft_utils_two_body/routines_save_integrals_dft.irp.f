
subroutine save_one_e_effective_potential  
 implicit none
 BEGIN_DOC 
! used to save the effective_one_e_potential into the one-body integrals in the ezfio folder
! this effective_one_e_potential is computed with the current density 
! and will couple the WFT with DFT for the next regular WFT calculation
 END_DOC
 call ezfio_set_mo_one_e_integrals_integral_nuclear(effective_one_e_potential_without_kin)
 call ezfio_set_mo_one_e_integrals_integral_kinetic(mo_kinetic_integral)

 print *,  'Effective DFT potential is written on disk on the mo_ne_integral integrals'
 call ezfio_set_mo_one_e_integrals_disk_access_mo_one_integrals("Read")

end

subroutine write_all_integrals_for_mrdft
 implicit none
 BEGIN_DOC
 ! saves all integrals needed for RS-DFT-MRCI calculation: one-body effective potential and two-elec erf integrals
 END_DOC
 call save_one_e_effective_potential
 call save_erf_bi_elec_integrals_mo
 call save_erf_bi_elec_integrals_ao
end

