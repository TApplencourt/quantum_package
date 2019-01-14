.. _tools:

.. program:: tools

.. default-role:: option

=====
tools
=====

Useful tools are grouped in this module.



Subroutines / functions
-----------------------



.. c:function:: diagonalize_h

    .. code:: text

        subroutine diagonalize_h

    File: :file:`diagonalize_h.irp.f`

    program that extracts the `n_states` lowest states of the Hamiltonian within the set of Slater determinants stored in the EZFIO folder





.. c:function:: fcidump

    .. code:: text

        subroutine fcidump

    File: :file:`fcidump.irp.f`

    Produce a regular FCIDUMP file from the MOs stored in the EZFIO folder. 

    To specify an active space, the class of the mos have to set in the EZFIO folder (see set_mo_class/qp_set_mo_class). 

    The fcidump program supports 3 types of MO_class : 

    * the "core" orbitals which are always doubly occupied in the calculation 

    * the "del" orbitals that are never occupied in the calculation 

    * the "act" orbitals that will be occupied by a varying number of electrons





.. c:function:: four_idx_transform

    .. code:: text

        subroutine four_idx_transform

    File: :file:`four_idx_transform.irp.f`

    4-index transformation of two-electron integrals from AO to MO integrals. 

    This program will compute the two-electron integrals on the MO basis and store it into the EZFIO folder. 

    This program can be useful if the AO --> MO transformation is an expensive step by itself.





.. c:function:: molden

    .. code:: text

        subroutine molden

    File: :file:`molden.irp.f`

    Produce a Molden file





.. c:function:: print_e_conv

    .. code:: text

        subroutine print_e_conv

    File: :file:`print_e_conv.irp.f`

    program that prints in a human readable format the convergence of the CIPSI algorithm. 

    for all istate, this program produces 

    * a file "EZFIO.istate.conv" containing the variational and var+PT2 energies as a function of N_det 

    * for istate > 1, a file EZFIO.istate.delta_e.conv containing the energy difference (both var and var+PT2) with the ground state as a function of N_det





.. c:function:: print_wf

    .. code:: text

        subroutine print_wf

    File: :file:`print_wf.irp.f`

    print the wave function stored in the EZFIO folder in the intermediate normalization. 

    it also prints a lot of information regarding the excitation operators from the reference determinant 

    and a first-order perturbative analysis of the wave function. 

    If the wave function strongly deviates from the first-order analysis, something funny is going on :)





.. c:function:: routine

    .. code:: text

        subroutine routine

    File: :file:`write_integrals_erf.irp.f`

    





.. c:function:: save_natorb

    .. code:: text

        subroutine save_natorb

    File: :file:`save_natorb.irp.f`

    Save natural MOs into the EZFIO 

    This program reads the wave function stored in the EZFIO folder, 

    extracts the corresponding natural orbitals and set them as the new MOs 

    If this is a multi-state calculation, the density matrix that produces the natural orbitals 

    is obtained from a state-averaged of the density matrices of each state with the corresponding state_average_weight (see the doc of state_average_weight).





.. c:function:: save_one_body_dm

    .. code:: text

        subroutine save_one_body_dm

    File: :file:`save_one_body_dm.irp.f`

    programs that computes the one body density on the mo basis for alpha and beta electrons from the wave function stored in the EZFIO folder, and then save it into the EZFIO folder aux_quantities. 

    Then, the global variable data_one_body_alpha_dm_mo and data_one_body_beta_dm_mo will automatically read the density in a further calculation. 

    This can be used to perform dampin on the density in RS-DFT calculation (see the density_for_dft module).





.. c:function:: save_one_e_dm

    .. code:: text

        subroutine save_one_e_dm

    File: :file:`save_one_e_dm.irp.f`

    programs that computes the one body density on the mo basis for alpha and beta electrons from the wave function stored in the EZFIO folder, and then save it into the EZFIO folder aux_quantities. 

    Then, the global variable data_one_e_dm_alpha_mo and data_one_e_dm_beta_mo will automatically read this density in a further calculation. 

    This can be used to perform damping on the density in RS-DFT calculation (see the density_for_dft module).





.. c:function:: save_ortho_mos

    .. code:: text

        subroutine save_ortho_mos

    File: :file:`save_ortho_mos.irp.f`

    Save orthonormalized MOs in the EZFIO. 

    This program reads the current MOs, computes the corresponding overlap matrix in the MO basis 

    and perform a Lowdin orthonormalization : :math:`MO_{new} = S^{-1/2} MO_{guess}`. 

    Thanks to the Lowdin orthonormalization, the new MOs are the most similar to the guess MOs.





.. c:function:: write_ao_basis

    .. code:: text

        subroutine write_Ao_basis(i_unit_output)

    File: :file:`molden.irp.f`

    





.. c:function:: write_geometry

    .. code:: text

        subroutine write_geometry(i_unit_output)

    File: :file:`molden.irp.f`

    





.. c:function:: write_integrals

    .. code:: text

        subroutine write_integrals

    File: :file:`write_integrals_erf.irp.f`

    Saves the two-electron integrals with the :math:`erf(\mu r_{12})/r_{12}` oprerator into the EZFIO folder





.. c:function:: write_intro_gamess

    .. code:: text

        subroutine write_intro_gamess(i_unit_output)

    File: :file:`molden.irp.f`

    





.. c:function:: write_mo_basis

    .. code:: text

        subroutine write_Mo_basis(i_unit_output)

    File: :file:`molden.irp.f`

    


