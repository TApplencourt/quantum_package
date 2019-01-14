.. _dft_utils_one_e:

.. program:: dft_utils_one_e

.. default-role:: option

===============
dft_utils_one_e
===============

This module contains all the one-body related quantities needed to perform DFT or RS-DFT calculations. 
Therefore, it contains most of the properties which depends on the one-body density and density matrix. 

The most important files and variables are:

* The general *providers* for the x/c energies in :file:`e_xc_general.irp.f`
* The general *providers* for the x/c potentials in :file:`pot_general.irp.f`
* The short-range hartree operator and all related quantities in :file:`sr_coulomb.irp.f`

These *providers* will be used in many DFT-related programs, such as :file:`ks_scf.irp.f` or :file:`rs_ks_scf.irp.f`. 
It is also needed to compute the effective one-body operator needed in multi-determinant RS-DFT (see plugins by eginer). 

Some other interesting quantities: 

* The LDA and PBE *providers* for the x/c energies in :file:`e_xc.irp.f` and :file:`sr_exc.irp.f`
* The LDA and PBE *providers* for the x/c potentials on the AO basis in :file:`pot_ao.irp.f` and  :file:`sr_pot_ao.irp.f`
* The :math:`h_{core}` energy computed directly with the one-body density matrix in :file:`one_e_energy_dft.irp.f`
* LDA and PBE short-range functionals *subroutines* in :file:`exc_sr_lda.irp.f` and :file:`exc_sr_pbe.irp.f`





Providers
---------


.. c:var:: aos_dsr_vc_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_dsr_vc_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_dsr_vx_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_dsr_vx_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_dvc_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_dvc_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_dvx_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_dvx_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_sr_vc_alpha_lda_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_lda_w	(n_points_final_grid,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_sr_vxc_alpha_LDA_w(j,i) = ao_i(r_j) * (sr_v^x_alpha(r_j) + sr_v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_sr_vc_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_sr_vc_beta_lda_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_lda_w	(n_points_final_grid,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_sr_vxc_alpha_LDA_w(j,i) = ao_i(r_j) * (sr_v^x_alpha(r_j) + sr_v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_sr_vc_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_sr_vx_alpha_lda_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_lda_w	(n_points_final_grid,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_sr_vxc_alpha_LDA_w(j,i) = ao_i(r_j) * (sr_v^x_alpha(r_j) + sr_v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_sr_vx_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_sr_vx_beta_lda_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_lda_w	(n_points_final_grid,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_sr_vxc_alpha_LDA_w(j,i) = ao_i(r_j) * (sr_v^x_alpha(r_j) + sr_v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_sr_vx_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_vc_alpha_lda_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vc_beta_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vx_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vx_beta_lda_w	(n_points_final_grid,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_LDA_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_vc_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_vc_beta_lda_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vc_beta_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vx_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vx_beta_lda_w	(n_points_final_grid,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_LDA_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_vc_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_vx_alpha_lda_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vc_beta_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vx_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vx_beta_lda_w	(n_points_final_grid,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_LDA_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_vx_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_vx_beta_lda_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vc_beta_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vx_alpha_lda_w	(n_points_final_grid,ao_num,N_states)
        double precision, allocatable	:: aos_vx_beta_lda_w	(n_points_final_grid,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_LDA_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: aos_vx_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: effective_one_e_potential

    .. code:: text

        double precision, allocatable	:: effective_one_e_potential	(mo_num,mo_num,N_states)
        double precision, allocatable	:: effective_one_e_potential_without_kin	(mo_num,mo_num,N_states)

    File: :file:`sr_coulomb.irp.f`

    Effective_one_e_potential(i,j) =  :math:`\rangle i| v_{H}^{sr} |j\rangle  + \rangle i| h_{core} |j\rangle  + \rangle i|v_{xc} |j\rangle` 

    Taking the expectation value does not provide any energy, but effective_one_e_potential(i,j) is the potential coupling DFT and WFT part to be used in any WFT calculation. 

    shifted_effective_one_e_potential_without_kin = effective_one_e_potential_without_kin + shifting_constant on the diagonal




.. c:var:: effective_one_e_potential_without_kin

    .. code:: text

        double precision, allocatable	:: effective_one_e_potential	(mo_num,mo_num,N_states)
        double precision, allocatable	:: effective_one_e_potential_without_kin	(mo_num,mo_num,N_states)

    File: :file:`sr_coulomb.irp.f`

    Effective_one_e_potential(i,j) =  :math:`\rangle i| v_{H}^{sr} |j\rangle  + \rangle i| h_{core} |j\rangle  + \rangle i|v_{xc} |j\rangle` 

    Taking the expectation value does not provide any energy, but effective_one_e_potential(i,j) is the potential coupling DFT and WFT part to be used in any WFT calculation. 

    shifted_effective_one_e_potential_without_kin = effective_one_e_potential_without_kin + shifting_constant on the diagonal




.. c:var:: energy_c

    .. code:: text

        double precision, allocatable	:: energy_x	(N_states)
        double precision, allocatable	:: energy_c	(N_states)

    File: :file:`e_xc_general.irp.f`

    correlation and exchange energies general providers.




.. c:var:: energy_c_lda

    .. code:: text

        double precision, allocatable	:: energy_x_lda	(N_states)
        double precision, allocatable	:: energy_c_lda	(N_states)

    File: :file:`e_xc.irp.f`

    exchange/correlation energy with the short range LDA functional




.. c:var:: energy_c_pbe

    .. code:: text

        double precision, allocatable	:: energy_x_pbe	(N_states)
        double precision, allocatable	:: energy_c_pbe	(N_states)

    File: :file:`e_xc.irp.f`

    exchange/correlation energy with the short range PBE functional




.. c:var:: energy_sr_c_lda

    .. code:: text

        double precision, allocatable	:: energy_sr_x_lda	(N_states)
        double precision, allocatable	:: energy_sr_c_lda	(N_states)

    File: :file:`sr_exc.irp.f`

    exchange/correlation energy with the short range LDA functional




.. c:var:: energy_sr_c_pbe

    .. code:: text

        double precision, allocatable	:: energy_sr_x_pbe	(N_states)
        double precision, allocatable	:: energy_sr_c_pbe	(N_states)

    File: :file:`sr_exc.irp.f`

    exchange/correlation energy with the short range PBE functional




.. c:var:: energy_sr_x_lda

    .. code:: text

        double precision, allocatable	:: energy_sr_x_lda	(N_states)
        double precision, allocatable	:: energy_sr_c_lda	(N_states)

    File: :file:`sr_exc.irp.f`

    exchange/correlation energy with the short range LDA functional




.. c:var:: energy_sr_x_pbe

    .. code:: text

        double precision, allocatable	:: energy_sr_x_pbe	(N_states)
        double precision, allocatable	:: energy_sr_c_pbe	(N_states)

    File: :file:`sr_exc.irp.f`

    exchange/correlation energy with the short range PBE functional




.. c:var:: energy_x

    .. code:: text

        double precision, allocatable	:: energy_x	(N_states)
        double precision, allocatable	:: energy_c	(N_states)

    File: :file:`e_xc_general.irp.f`

    correlation and exchange energies general providers.




.. c:var:: energy_x_lda

    .. code:: text

        double precision, allocatable	:: energy_x_lda	(N_states)
        double precision, allocatable	:: energy_c_lda	(N_states)

    File: :file:`e_xc.irp.f`

    exchange/correlation energy with the short range LDA functional




.. c:var:: energy_x_pbe

    .. code:: text

        double precision, allocatable	:: energy_x_pbe	(N_states)
        double precision, allocatable	:: energy_c_pbe	(N_states)

    File: :file:`e_xc.irp.f`

    exchange/correlation energy with the short range PBE functional




.. c:var:: gga_sr_type_functionals

    .. code:: text

        subroutine GGA_sr_type_functionals(r,rho_a,rho_b,grad_rho_a_2,grad_rho_b_2,grad_rho_a_b, &
                                        ex,vx_rho_a,vx_rho_b,vx_grad_rho_a_2,vx_grad_rho_b_2,vx_grad_rho_a_b, &
                                        ec,vc_rho_a,vc_rho_b,vc_grad_rho_a_2,vc_grad_rho_b_2,vc_grad_rho_a_b )

    File: :file:`utils.irp.f`

    routine that helps in building the x/c potentials on the AO basis for a GGA functional with a short-range interaction




.. c:var:: gga_type_functionals

    .. code:: text

        subroutine GGA_type_functionals(r,rho_a,rho_b,grad_rho_a_2,grad_rho_b_2,grad_rho_a_b, &
                                        ex,vx_rho_a,vx_rho_b,vx_grad_rho_a_2,vx_grad_rho_b_2,vx_grad_rho_a_b, &
                                        ec,vc_rho_a,vc_rho_b,vc_grad_rho_a_2,vc_grad_rho_b_2,vc_grad_rho_a_b )

    File: :file:`utils.irp.f`

    routine that helps in building the x/c potentials on the AO basis for a GGA functional




.. c:var:: grad_aos_dsr_vc_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: grad_aos_dsr_vc_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: grad_aos_dsr_vx_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: grad_aos_dsr_vx_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_sr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_sr_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dsr_vx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`sr_pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: grad_aos_dvc_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: grad_aos_dvc_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: grad_aos_dvx_alpha_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: grad_aos_dvx_beta_pbe_w

    .. code:: text

        double precision, allocatable	:: aos_vc_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vc_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_alpha_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_vx_beta_pbe_w	(ao_num,n_points_final_grid,N_states)
        double precision, allocatable	:: aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvc_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_alpha_pbe_w	(ao_num,n_points_final_grid,3,N_states)
        double precision, allocatable	:: grad_aos_dvx_beta_pbe_w	(ao_num,n_points_final_grid,3,N_states)

    File: :file:`pot_ao.irp.f`

    aos_vxc_alpha_PBE_w(j,i) = ao_i(r_j) * (v^x_alpha(r_j) + v^c_alpha(r_j)) * W(r_j)




.. c:var:: mu_erf_dft

    .. code:: text

        double precision	:: mu_erf_dft

    File: :file:`mu_erf_dft.irp.f`

    range separation parameter used in RS-DFT. It is set to mu_erf in order to be consistent with the two electrons integrals erf




.. c:var:: potential_c_alpha_ao

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao	(ao_num,ao_num,N_states)

    File: :file:`pot_general.irp.f`

    general providers for the alpha/beta exchange/correlation potentials on the AO basis




.. c:var:: potential_c_alpha_ao_lda

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao_lda	(ao_num,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    short range exchange/correlation alpha/beta potentials with LDA functional on the AO basis




.. c:var:: potential_c_alpha_ao_pbe

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao_pbe	(ao_num,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    exchange/correlation alpha/beta potentials with the short range PBE functional on the AO basis




.. c:var:: potential_c_alpha_mo

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_x_beta_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_c_alpha_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_c_beta_mo	(mo_num,mo_num,N_states)

    File: :file:`pot_general.irp.f`

    general providers for the alpha/beta exchange/correlation potentials on the MO basis




.. c:var:: potential_c_beta_ao

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao	(ao_num,ao_num,N_states)

    File: :file:`pot_general.irp.f`

    general providers for the alpha/beta exchange/correlation potentials on the AO basis




.. c:var:: potential_c_beta_ao_lda

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao_lda	(ao_num,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    short range exchange/correlation alpha/beta potentials with LDA functional on the AO basis




.. c:var:: potential_c_beta_ao_pbe

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao_pbe	(ao_num,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    exchange/correlation alpha/beta potentials with the short range PBE functional on the AO basis




.. c:var:: potential_c_beta_mo

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_x_beta_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_c_alpha_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_c_beta_mo	(mo_num,mo_num,N_states)

    File: :file:`pot_general.irp.f`

    general providers for the alpha/beta exchange/correlation potentials on the MO basis




.. c:var:: potential_sr_c_alpha_ao_lda

    .. code:: text

        double precision, allocatable	:: potential_sr_c_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_beta_ao_lda	(ao_num,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    short range correlation alpha/beta potentials with LDA functional on the |AO| basis




.. c:var:: potential_sr_c_alpha_ao_pbe

    .. code:: text

        double precision, allocatable	:: potential_sr_x_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_x_beta_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_beta_ao_pbe	(ao_num,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    exchange/correlation alpha/beta potentials with the short range PBE functional on the AO basis




.. c:var:: potential_sr_c_beta_ao_lda

    .. code:: text

        double precision, allocatable	:: potential_sr_c_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_beta_ao_lda	(ao_num,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    short range correlation alpha/beta potentials with LDA functional on the |AO| basis




.. c:var:: potential_sr_c_beta_ao_pbe

    .. code:: text

        double precision, allocatable	:: potential_sr_x_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_x_beta_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_beta_ao_pbe	(ao_num,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    exchange/correlation alpha/beta potentials with the short range PBE functional on the AO basis




.. c:var:: potential_sr_x_alpha_ao_lda

    .. code:: text

        double precision, allocatable	:: potential_sr_x_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_x_beta_ao_lda	(ao_num,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    short range exchange alpha/beta potentials with LDA functional on the |AO| basis




.. c:var:: potential_sr_x_alpha_ao_pbe

    .. code:: text

        double precision, allocatable	:: potential_sr_x_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_x_beta_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_beta_ao_pbe	(ao_num,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    exchange/correlation alpha/beta potentials with the short range PBE functional on the AO basis




.. c:var:: potential_sr_x_beta_ao_lda

    .. code:: text

        double precision, allocatable	:: potential_sr_x_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_x_beta_ao_lda	(ao_num,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    short range exchange alpha/beta potentials with LDA functional on the |AO| basis




.. c:var:: potential_sr_x_beta_ao_pbe

    .. code:: text

        double precision, allocatable	:: potential_sr_x_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_x_beta_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_sr_c_beta_ao_pbe	(ao_num,ao_num,N_states)

    File: :file:`sr_pot_ao.irp.f`

    exchange/correlation alpha/beta potentials with the short range PBE functional on the AO basis




.. c:var:: potential_x_alpha_ao

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao	(ao_num,ao_num,N_states)

    File: :file:`pot_general.irp.f`

    general providers for the alpha/beta exchange/correlation potentials on the AO basis




.. c:var:: potential_x_alpha_ao_lda

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao_lda	(ao_num,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    short range exchange/correlation alpha/beta potentials with LDA functional on the AO basis




.. c:var:: potential_x_alpha_ao_pbe

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao_pbe	(ao_num,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    exchange/correlation alpha/beta potentials with the short range PBE functional on the AO basis




.. c:var:: potential_x_alpha_mo

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_x_beta_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_c_alpha_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_c_beta_mo	(mo_num,mo_num,N_states)

    File: :file:`pot_general.irp.f`

    general providers for the alpha/beta exchange/correlation potentials on the MO basis




.. c:var:: potential_x_beta_ao

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao	(ao_num,ao_num,N_states)

    File: :file:`pot_general.irp.f`

    general providers for the alpha/beta exchange/correlation potentials on the AO basis




.. c:var:: potential_x_beta_ao_lda

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao_lda	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao_lda	(ao_num,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    short range exchange/correlation alpha/beta potentials with LDA functional on the AO basis




.. c:var:: potential_x_beta_ao_pbe

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_x_beta_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_alpha_ao_pbe	(ao_num,ao_num,N_states)
        double precision, allocatable	:: potential_c_beta_ao_pbe	(ao_num,ao_num,N_states)

    File: :file:`pot_ao.irp.f`

    exchange/correlation alpha/beta potentials with the short range PBE functional on the AO basis




.. c:var:: potential_x_beta_mo

    .. code:: text

        double precision, allocatable	:: potential_x_alpha_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_x_beta_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_c_alpha_mo	(mo_num,mo_num,N_states)
        double precision, allocatable	:: potential_c_beta_mo	(mo_num,mo_num,N_states)

    File: :file:`pot_general.irp.f`

    general providers for the alpha/beta exchange/correlation potentials on the MO basis




.. c:var:: psi_dft_energy_h_core

    .. code:: text

        double precision, allocatable	:: psi_dft_energy_kinetic	(N_states)
        double precision, allocatable	:: psi_dft_energy_nuclear_elec	(N_states)
        double precision, allocatable	:: psi_dft_energy_h_core	(N_states)

    File: :file:`one_e_energy_dft.irp.f`

    kinetic, electron-nuclear and total h_core energy computed with the density matrix one_e_dm_mo_beta_for_dft+one_e_dm_mo_alpha_for_dft




.. c:var:: psi_dft_energy_kinetic

    .. code:: text

        double precision, allocatable	:: psi_dft_energy_kinetic	(N_states)
        double precision, allocatable	:: psi_dft_energy_nuclear_elec	(N_states)
        double precision, allocatable	:: psi_dft_energy_h_core	(N_states)

    File: :file:`one_e_energy_dft.irp.f`

    kinetic, electron-nuclear and total h_core energy computed with the density matrix one_e_dm_mo_beta_for_dft+one_e_dm_mo_alpha_for_dft




.. c:var:: psi_dft_energy_nuclear_elec

    .. code:: text

        double precision, allocatable	:: psi_dft_energy_kinetic	(N_states)
        double precision, allocatable	:: psi_dft_energy_nuclear_elec	(N_states)
        double precision, allocatable	:: psi_dft_energy_h_core	(N_states)

    File: :file:`one_e_energy_dft.irp.f`

    kinetic, electron-nuclear and total h_core energy computed with the density matrix one_e_dm_mo_beta_for_dft+one_e_dm_mo_alpha_for_dft




.. c:var:: shifting_constant

    .. code:: text

        double precision, allocatable	:: shifting_constant	(N_states)

    File: :file:`shifted_potential.irp.f`

    shifting_constant = (E_{Hxc} - <\Psi | V_{Hxc} | \Psi>) / N_elec constant to add to the potential in order to obtain the variational energy as the eigenvalue of the effective long-range Hamiltonian (see original paper of Levy PRL 113, 113002 (2014), equation (17) )




.. c:var:: short_range_hartree

    .. code:: text

        double precision, allocatable	:: short_range_hartree_operator	(mo_num,mo_num,N_states)
        double precision, allocatable	:: short_range_hartree	(N_states)

    File: :file:`sr_coulomb.irp.f`

    short_range_Hartree_operator(i,j) =  :math:`\int dr i(r)j(r) \int r' \rho(r') W_{ee}^{sr}` 

    short_range_Hartree =  :math:`1/2  \sum_{i,j} \rho_{ij} \mathtt{short_range_Hartree_operator}(i,j)` 

    =  :math:`1/2  \int dr \int r' \rho(r) \rho(r') W_{ee}^{sr}`




.. c:var:: short_range_hartree_operator

    .. code:: text

        double precision, allocatable	:: short_range_hartree_operator	(mo_num,mo_num,N_states)
        double precision, allocatable	:: short_range_hartree	(N_states)

    File: :file:`sr_coulomb.irp.f`

    short_range_Hartree_operator(i,j) =  :math:`\int dr i(r)j(r) \int r' \rho(r') W_{ee}^{sr}` 

    short_range_Hartree =  :math:`1/2  \sum_{i,j} \rho_{ij} \mathtt{short_range_Hartree_operator}(i,j)` 

    =  :math:`1/2  \int dr \int r' \rho(r) \rho(r') W_{ee}^{sr}`




.. c:var:: trace_v_h

    .. code:: text

        double precision, allocatable	:: trace_v_xc	(N_states)
        double precision, allocatable	:: trace_v_h	(N_states)
        double precision, allocatable	:: trace_v_hxc	(N_states)

    File: :file:`pot_general.irp.f`

    Trace_v_xc  = \sum_{i,j} (rho_{ij}_\alpha v^{xc}_{ij}^\alpha  + rho_{ij}_\beta v^{xc}_{ij}^\beta) Trace_v_Hxc = \sum_{i,j} v^{H}_{ij} (rho_{ij}_\alpha + rho_{ij}_\beta) Trace_v_Hxc = \sum_{i,j} rho_{ij} v^{Hxc}_{ij}




.. c:var:: trace_v_hxc

    .. code:: text

        double precision, allocatable	:: trace_v_xc	(N_states)
        double precision, allocatable	:: trace_v_h	(N_states)
        double precision, allocatable	:: trace_v_hxc	(N_states)

    File: :file:`pot_general.irp.f`

    Trace_v_xc  = \sum_{i,j} (rho_{ij}_\alpha v^{xc}_{ij}^\alpha  + rho_{ij}_\beta v^{xc}_{ij}^\beta) Trace_v_Hxc = \sum_{i,j} v^{H}_{ij} (rho_{ij}_\alpha + rho_{ij}_\beta) Trace_v_Hxc = \sum_{i,j} rho_{ij} v^{Hxc}_{ij}




.. c:var:: trace_v_xc

    .. code:: text

        double precision, allocatable	:: trace_v_xc	(N_states)
        double precision, allocatable	:: trace_v_h	(N_states)
        double precision, allocatable	:: trace_v_hxc	(N_states)

    File: :file:`pot_general.irp.f`

    Trace_v_xc  = \sum_{i,j} (rho_{ij}_\alpha v^{xc}_{ij}^\alpha  + rho_{ij}_\beta v^{xc}_{ij}^\beta) Trace_v_Hxc = \sum_{i,j} v^{H}_{ij} (rho_{ij}_\alpha + rho_{ij}_\beta) Trace_v_Hxc = \sum_{i,j} rho_{ij} v^{Hxc}_{ij}




Subroutines / functions
-----------------------



.. c:function:: berf

    .. code:: text

        function berf(a)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: dberfda

    .. code:: text

        function dberfda(a)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: dpol

    .. code:: text

        double precision function dpol(rs)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: dpold

    .. code:: text

        double precision function dpold(rs)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: dpoldd

    .. code:: text

        double precision function dpoldd(rs)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: ec_lda

    .. code:: text

        subroutine ec_lda(rho_a,rho_b,ec,vc_a,vc_b)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: ec_lda_sr

    .. code:: text

        subroutine ec_lda_sr(mu,rho_a,rho_b,ec,vc_a,vc_b)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: ec_only_lda_sr

    .. code:: text

        subroutine ec_only_lda_sr(mu,rho_a,rho_b,ec)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: ec_pbe_only

    .. code:: text

        subroutine ec_pbe_only(mu,rhoc,rhoo,sigmacc,sigmaco,sigmaoo,ec)

    File: :file:`exc_sr_pbe.irp.f`

    Short-range PBE correlation energy functional for erf interaction 

    input : ========== 

    mu = range separated parameter 

    rhoc, rhoo = total density and spin density 

    sigmacc    = square of the gradient of the total density 

    sigmaco    = square of the gradient of the spin density 

    sigmaoo    = scalar product between the gradient of the total density and the one of the spin density 

    output: ========== 

    ec         = correlation energy 







.. c:function:: ec_pbe_sr

    .. code:: text

        subroutine ec_pbe_sr(mu,rhoc,rhoo,sigmacc,sigmaco,sigmaoo,ec,vrhoc,vrhoo,vsigmacc,vsigmaco,vsigmaoo)

    File: :file:`exc_sr_pbe.irp.f`

    Short-range PBE correlation energy functional for erf interaction 

    input : ========== 

    mu = range separated parameter 

    rhoc, rhoo = total density and spin density 

    sigmacc    = square of the gradient of the total density 

    sigmaco    = square of the gradient of the spin density 

    sigmaoo    = scalar product between the gradient of the total density and the one of the spin density 

    output: ========== 

    ec         = correlation energy 

    all variables v** are energy derivatives with respect to components of the density 

    vrhoc      = derivative with respect to the total density 

    vrhoo      = derivative with respect to spin density 

    vsigmacc   = derivative with respect to the square of the gradient of the total density 

    vsigmaco   = derivative with respect to scalar product between the gradients of total and spin densities 

    vsigmaoo   = derivative with respect to the square of the gradient of the psin density





.. c:function:: ecorrlr

    .. code:: text

        subroutine ecorrlr(rs,z,mu,eclr)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: ecpw

    .. code:: text

        subroutine ecPW(x,y,ec,ecd,ecz,ecdd,eczd)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: ex_lda

    .. code:: text

        subroutine ex_lda(rho_a,rho_b,ex,vx_a,vx_b)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: ex_lda_sr

    .. code:: text

        subroutine ex_lda_sr(mu,rho_a,rho_b,ex,vx_a,vx_b)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: ex_pbe_sr

    .. code:: text

        subroutine ex_pbe_sr(mu,rho_a,rho_b,grd_rho_a_2,grd_rho_b_2,grd_rho_a_b,ex,vx_rho_a,vx_rho_b,vx_grd_rho_a_2,vx_grd_rho_b_2,vx_grd_rho_a_b)

    File: :file:`exc_sr_pbe.irp.f`

    mu    = range separation parameter rho_a = density alpha rho_b = density beta grd_rho_a_2 = (gradient rho_a)^2 grd_rho_b_2 = (gradient rho_b)^2 grd_rho_a_b = (gradient rho_a).(gradient rho_b) ex = exchange energy density at the density and corresponding gradients of the density vx_rho_a = d ex / d rho_a vx_rho_b = d ex / d rho_b vx_grd_rho_a_2 = d ex / d grd_rho_a_2 vx_grd_rho_b_2 = d ex / d grd_rho_b_2 vx_grd_rho_a_b = d ex / d grd_rho_a_b





.. c:function:: ex_pbe_sr_only

    .. code:: text

        subroutine ex_pbe_sr_only(mu,rho_a,rho_b,grd_rho_a_2,grd_rho_b_2,grd_rho_a_b,ex)

    File: :file:`exc_sr_pbe.irp.f`

    rho_a = density alpha rho_b = density beta grd_rho_a_2 = (gradient rho_a)^2 grd_rho_b_2 = (gradient rho_b)^2 grd_rho_a_b = (gradient rho_a).(gradient rho_b) ex = exchange energy density at point r





.. c:function:: g0d

    .. code:: text

        double precision function g0d(rs)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: g0dd

    .. code:: text

        double precision function g0dd(rs)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: g0f

    .. code:: text

        double precision function g0f(x)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: gpw

    .. code:: text

        subroutine GPW(x,Ac,alfa1,beta1,beta2,beta3,beta4,G,Gd,Gdd)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: grad_rho_ab_to_grad_rho_oc

    .. code:: text

        subroutine grad_rho_ab_to_grad_rho_oc(grad_rho_a_2,grad_rho_b_2,grad_rho_a_b,grad_rho_o_2,grad_rho_c_2,grad_rho_o_c)

    File: :file:`rho_ab_to_rho_tot.irp.f`

    





.. c:function:: qrpa

    .. code:: text

        double precision function Qrpa(x)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: qrpad

    .. code:: text

        double precision function Qrpad(x)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: qrpadd

    .. code:: text

        double precision function Qrpadd(x)

    File: :file:`exc_sr_lda.irp.f`

    





.. c:function:: rho_ab_to_rho_oc

    .. code:: text

        subroutine rho_ab_to_rho_oc(rho_a,rho_b,rho_o,rho_c)

    File: :file:`rho_ab_to_rho_tot.irp.f`

    





.. c:function:: rho_oc_to_rho_ab

    .. code:: text

        subroutine rho_oc_to_rho_ab(rho_o,rho_c,rho_a,rho_b)

    File: :file:`rho_ab_to_rho_tot.irp.f`

    





.. c:function:: v_grad_rho_oc_to_v_grad_rho_ab

    .. code:: text

        subroutine v_grad_rho_oc_to_v_grad_rho_ab(v_grad_rho_o_2,v_grad_rho_c_2,v_grad_rho_o_c,v_grad_rho_a_2,v_grad_rho_b_2,v_grad_rho_a_b)

    File: :file:`rho_ab_to_rho_tot.irp.f`

    





.. c:function:: v_rho_ab_to_v_rho_oc

    .. code:: text

        subroutine v_rho_ab_to_v_rho_oc(v_rho_a,v_rho_b,v_rho_o,v_rho_c)

    File: :file:`rho_ab_to_rho_tot.irp.f`

    





.. c:function:: v_rho_oc_to_v_rho_ab

    .. code:: text

        subroutine v_rho_oc_to_v_rho_ab(v_rho_o,v_rho_c,v_rho_a,v_rho_b)

    File: :file:`rho_ab_to_rho_tot.irp.f`

    





.. c:function:: vcorrlr

    .. code:: text

        subroutine vcorrlr(rs,z,mu,vclrup,vclrdown,vclrupd,vclrdownd)

    File: :file:`exc_sr_lda.irp.f`

    


