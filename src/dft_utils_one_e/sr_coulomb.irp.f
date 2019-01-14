 BEGIN_PROVIDER [double precision, short_range_Hartree_operator, (mo_num,mo_num,N_states)]
&BEGIN_PROVIDER [double precision, short_range_Hartree, (N_states)]
 implicit none
 BEGIN_DOC
! short_range_Hartree_operator(i,j) = $\int dr i(r)j(r) \int r' \rho(r') W_{ee}^{sr}$
!
! short_range_Hartree = $1/2  \sum_{i,j} \rho_{ij} \mathtt{short_range_Hartree_operator}(i,j)$
!
!                     = $1/2  \int dr \int r' \rho(r) \rho(r') W_{ee}^{sr}$
 END_DOC
 integer :: i,j,k,l,m,n,istate
 double precision :: get_two_e_integral,get_mo_two_e_integral_erf
 double precision :: integral, integral_erf, contrib
 double precision :: integrals_array(mo_num,mo_num),integrals_erf_array(mo_num,mo_num)
 short_range_Hartree_operator = 0.d0
 short_range_Hartree = 0.d0
 do i = 1, mo_num
  do j = 1, mo_num
   if(dabs(one_e_dm_average_mo_for_dft(j,i)).le.1.d-12)cycle
   call get_mo_two_e_integrals_i1j1(i,j,mo_num,integrals_array,mo_integrals_map)
   call get_mo_two_e_integrals_erf_i1j1(i,j,mo_num,integrals_erf_array,mo_integrals_erf_map)
   do istate = 1, N_states
    do k = 1, mo_num
     do l = 1, mo_num
      integral = integrals_array(l,k)
      integral_erf = integrals_erf_array(l,k)
      contrib = one_e_dm_mo_for_dft(i,j,istate) * (integral  - integral_erf)
      short_range_Hartree_operator(l,k,istate) += contrib 
      short_range_Hartree(istate) += contrib * one_e_dm_mo_for_dft(k,l,istate) 
     enddo
    enddo
   enddo
  enddo
 enddo
 short_range_Hartree = short_range_Hartree * 0.5d0
 print*, 'short_range_Hartree',short_range_Hartree
END_PROVIDER


 BEGIN_PROVIDER [double precision, effective_one_e_potential, (mo_num, mo_num,N_states)]
&BEGIN_PROVIDER [double precision, effective_one_e_potential_without_kin, (mo_num, mo_num,N_states)]
 implicit none
 integer :: i,j,istate
 effective_one_e_potential = 0.d0
 BEGIN_DOC
! Effective_one_e_potential(i,j) = $\rangle i| v_{H}^{sr} |j\rangle  + \rangle i| h_{core} |j\rangle  + \rangle i|v_{xc} |j\rangle$
!
! Taking the expectation value does not provide any energy, but
! effective_one_e_potential(i,j) is the potential coupling DFT and WFT part to
! be used in any WFT calculation.
!
! shifted_effective_one_e_potential_without_kin = effective_one_e_potential_without_kin + shifting_constant on the diagonal
 END_DOC
 do istate = 1, N_states
  do i = 1, mo_num
   do j = 1, mo_num
    effective_one_e_potential(i,j,istate) = short_range_Hartree_operator(i,j,istate) + mo_integrals_n_e(i,j) + mo_kinetic_integrals(i,j)    & 
                                   + 0.5d0 * (potential_x_alpha_mo(i,j,istate) + potential_c_alpha_mo(i,j,istate)                               &
                                   +          potential_x_beta_mo(i,j,istate)  + potential_c_beta_mo(i,j,istate)   )
    effective_one_e_potential_without_kin(i,j,istate) = short_range_Hartree_operator(i,j,istate) + mo_integrals_n_e(i,j)                   & 
                                   + 0.5d0 * (potential_x_alpha_mo(i,j,istate) + potential_c_alpha_mo(i,j,istate)                               &
                                   +          potential_x_beta_mo(i,j,istate)  + potential_c_beta_mo(i,j,istate)   )
   enddo
  enddo
 enddo
END_PROVIDER 


