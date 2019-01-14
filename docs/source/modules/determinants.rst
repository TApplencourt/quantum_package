.. _determinants:

.. program:: determinants

.. default-role:: option

============
determinants
============

Contains everything for the computation of the Hamiltonian matrix elements in the basis of orthogonal Slater determinants built on a restricted spin-orbitals basis.

The main providers for this module are:

* :option:`determinants n_states`: number of states to be computed
* `psi_det`: list of determinants in the wave function used in many routines/providers of the |QP|. 
* `psi_coef`: list of coefficients, for all :option:`determinants n_states` states, and all determinants. 

The main routines for this module are:

* `i_H_j`: computes the Hamiltonian matrix element between two arbitrary Slater determinants.
* `i_H_j_s2`: computes the Hamiltonian and (:math:`S^2`) matrix element between two arbitrary Slater determinants.
* `i_H_j_verbose`: returns the decomposition in terms of one- and two-body components of the Hamiltonian matrix elements between two arbitrary Slater determinants. Also return the fermionic phase factor. 
* `i_H_psi`: computes the Hamiltonian matrix element between an arbitrary Slater determinant and a wave function composed of a sum of arbitrary Slater determinants. 


For an example of how to use these routines and providers, take a look at :file:`example.irp.f`. 



EZFIO parameters
----------------

.. option:: n_det_max

    Maximum number of determinants in the wave function

    Default: 1000000

.. option:: n_det_print_wf

    Maximum number of determinants to be printed with the program print_wf

    Default: 10000

.. option:: n_det_max_full

    Maximum number of determinants where |H| is fully diagonalized

    Default: 1000

.. option:: n_states

    Number of states to consider

    Default: 1

.. option:: read_wf

    If |true|, read the wave function from the |EZFIO| file

    Default: False

.. option:: s2_eig

    Force the wave function to be an eigenfunction of |S^2|

    Default: True

.. option:: used_weight

    0: 1./(c_0^2), 1: 1/N_states, 2: input state-average weight, 3: 1/(Norm_L3(Psi))

    Default: 0

.. option:: threshold_generators

    Thresholds on generators (fraction of the square of the norm)

    Default: 0.99

.. option:: n_int

    Number of integers required to represent bitstrings (set in module :ref:`bitmask`)


.. option:: bit_kind

    (set in module :ref:`bitmask`)


.. option:: mo_label

    Label of the |MOs| on which the determinants are expressed


.. option:: n_det

    Number of determinants in the current wave function


.. option:: psi_coef

    Coefficients of the wave function


.. option:: psi_det

    Determinants of the variational space


.. option:: expected_s2

    Expected value of |S^2|


.. option:: target_energy

    Energy that should be obtained when truncating the wave function (optional)

    Default: 0.

.. option:: state_average_weight

    Weight of the states in state-average calculations.



Providers
---------


.. c:var:: abs_psi_coef_max

    .. code:: text

        double precision, allocatable	:: psi_coef_max	(N_states)
        double precision, allocatable	:: psi_coef_min	(N_states)
        double precision, allocatable	:: abs_psi_coef_max	(N_states)
        double precision, allocatable	:: abs_psi_coef_min	(N_states)

    File: :file:`determinants.irp.f`

    Max and min values of the coefficients




.. c:var:: abs_psi_coef_min

    .. code:: text

        double precision, allocatable	:: psi_coef_max	(N_states)
        double precision, allocatable	:: psi_coef_min	(N_states)
        double precision, allocatable	:: abs_psi_coef_max	(N_states)
        double precision, allocatable	:: abs_psi_coef_min	(N_states)

    File: :file:`determinants.irp.f`

    Max and min values of the coefficients




.. c:var:: barycentric_electronic_energy

    .. code:: text

        double precision, allocatable	:: barycentric_electronic_energy	(N_states)

    File: :file:`energy.irp.f`

     :math:`E_n = \sum_i {c_i^{(n)}}^2 H_{ii}`




.. c:var:: c0_weight

    .. code:: text

        double precision, allocatable	:: c0_weight	(N_states)

    File: :file:`density_matrix.irp.f`

    Weight of the states in the selection :  :math:`\frac{1}{c_0^2}` .




.. c:var:: det_alpha_norm

    .. code:: text

        double precision, allocatable	:: det_alpha_norm	(N_det_alpha_unique)
        double precision, allocatable	:: det_beta_norm	(N_det_beta_unique)

    File: :file:`spindeterminants.irp.f`

    Norm of the  :math:`\alpha`  and  :math:`\beta`  spin determinants in the wave function: 

     :math:`||D_\alpha||_i = \sum_j C_{ij}^2`




.. c:var:: det_beta_norm

    .. code:: text

        double precision, allocatable	:: det_alpha_norm	(N_det_alpha_unique)
        double precision, allocatable	:: det_beta_norm	(N_det_beta_unique)

    File: :file:`spindeterminants.irp.f`

    Norm of the  :math:`\alpha`  and  :math:`\beta`  spin determinants in the wave function: 

     :math:`||D_\alpha||_i = \sum_j C_{ij}^2`




.. c:var:: det_to_occ_pattern

    .. code:: text

        integer, allocatable	:: det_to_occ_pattern	(N_det)

    File: :file:`occ_pattern.irp.f`

    Returns the index of the occupation pattern for each determinant




.. c:var:: diag_algorithm

    .. code:: text

        character*(64)	:: diag_algorithm

    File: :file:`determinants.irp.f`

    Diagonalization algorithm (Davidson or Lapack)




.. c:var:: diagonal_h_matrix_on_psi_det

    .. code:: text

        double precision, allocatable	:: diagonal_h_matrix_on_psi_det	(N_det)

    File: :file:`energy.irp.f`

    Diagonal of the Hamiltonian ordered as psi_det




.. c:var:: double_exc_bitmask

    .. code:: text

        integer(bit_kind), allocatable	:: double_exc_bitmask	(N_int,4,N_double_exc_bitmasks)

    File: :file:`determinants_bitmasks.irp.f`

    double_exc_bitmask(:,1,i) is the bitmask for holes of excitation 1 

    double_exc_bitmask(:,2,i) is the bitmask for particles of excitation 1 

    double_exc_bitmask(:,3,i) is the bitmask for holes of excitation 2 

    double_exc_bitmask(:,4,i) is the bitmask for particles of excitation 2 

    for a given couple of hole/particle excitations i.




.. c:var:: expected_s2

    .. code:: text

        double precision	:: expected_s2

    File: :file:`s2.irp.f`

    Expected value of |S^2| : S*(S+1)




.. c:var:: fock_operator_closed_shell_ref_bitmask

    .. code:: text

        double precision, allocatable	:: fock_operator_closed_shell_ref_bitmask	(mo_num,mo_num)

    File: :file:`single_excitations.irp.f`

    




.. c:var:: fock_wee_closed_shell

    .. code:: text

        double precision, allocatable	:: fock_wee_closed_shell	(mo_num,mo_num)

    File: :file:`mono_excitations_bielec.irp.f`

    




.. c:var:: h_apply_buffer_allocated

    .. code:: text

        logical	:: h_apply_buffer_allocated
        integer(omp_lock_kind), allocatable	:: h_apply_buffer_lock	(64,0:nproc-1)

    File: :file:`h_apply.irp.f`

    Buffer of determinants/coefficients/perturbative energy for H_apply. Uninitialized. Filled by H_apply subroutines.




.. c:var:: h_apply_buffer_lock

    .. code:: text

        logical	:: h_apply_buffer_allocated
        integer(omp_lock_kind), allocatable	:: h_apply_buffer_lock	(64,0:nproc-1)

    File: :file:`h_apply.irp.f`

    Buffer of determinants/coefficients/perturbative energy for H_apply. Uninitialized. Filled by H_apply subroutines.




.. c:var:: h_matrix_all_dets

    .. code:: text

        double precision, allocatable	:: h_matrix_all_dets	(N_det,N_det)

    File: :file:`utils.irp.f`

    |H| matrix on the basis of the Slater determinants defined by psi_det




.. c:var:: h_matrix_cas

    .. code:: text

        double precision, allocatable	:: h_matrix_cas	(N_det_cas,N_det_cas)

    File: :file:`psi_cas.irp.f`

    




.. c:var:: idx_cas

    .. code:: text

        integer(bit_kind), allocatable	:: psi_cas	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_cas_coef	(psi_det_size,n_states)
        integer, allocatable	:: idx_cas	(psi_det_size)
        integer	:: n_det_cas

    File: :file:`psi_cas.irp.f`

    |CAS| wave function, defined from the application of the |CAS| bitmask on the determinants. idx_cas gives the indice of the |CAS| determinant in psi_det.




.. c:var:: idx_non_cas

    .. code:: text

        integer(bit_kind), allocatable	:: psi_non_cas	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_non_cas_coef	(psi_det_size,n_states)
        integer, allocatable	:: idx_non_cas	(psi_det_size)
        integer	:: n_det_non_cas

    File: :file:`psi_cas.irp.f`

    Set of determinants which are not part of the |CAS|, defined from the application of the |CAS| bitmask on the determinants. idx_non_cas gives the indice of the determinant in psi_det.




.. c:var:: max_degree_exc

    .. code:: text

        integer	:: max_degree_exc

    File: :file:`determinants.irp.f`

    Maximum degree of excitation in the wave function with respect to the Hartree-Fock determinant.




.. c:var:: mo_energy_expval

    .. code:: text

        double precision, allocatable	:: mo_energy_expval	(N_states,mo_num,2,2)

    File: :file:`mo_energy_expval.irp.f`

    Third index is spin. Fourth index is 1:creation, 2:annihilation




.. c:var:: n_det

    .. code:: text

        integer	:: n_det

    File: :file:`determinants.irp.f`

    Number of determinants in the wave function




.. c:var:: n_det_alpha_unique

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_alpha_unique	(N_int,psi_det_size)
        integer	:: n_det_alpha_unique

    File: :file:`spindeterminants.irp.f_template_144`

    Unique  :math:`\alpha`  determinants




.. c:var:: n_det_beta_unique

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_beta_unique	(N_int,psi_det_size)
        integer	:: n_det_beta_unique

    File: :file:`spindeterminants.irp.f_template_144`

    Unique  :math:`\beta`  determinants




.. c:var:: n_det_cas

    .. code:: text

        integer(bit_kind), allocatable	:: psi_cas	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_cas_coef	(psi_det_size,n_states)
        integer, allocatable	:: idx_cas	(psi_det_size)
        integer	:: n_det_cas

    File: :file:`psi_cas.irp.f`

    |CAS| wave function, defined from the application of the |CAS| bitmask on the determinants. idx_cas gives the indice of the |CAS| determinant in psi_det.




.. c:var:: n_det_non_cas

    .. code:: text

        integer(bit_kind), allocatable	:: psi_non_cas	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_non_cas_coef	(psi_det_size,n_states)
        integer, allocatable	:: idx_non_cas	(psi_det_size)
        integer	:: n_det_non_cas

    File: :file:`psi_cas.irp.f`

    Set of determinants which are not part of the |CAS|, defined from the application of the |CAS| bitmask on the determinants. idx_non_cas gives the indice of the determinant in psi_det.




.. c:var:: n_double_exc_bitmasks

    .. code:: text

        integer	:: n_double_exc_bitmasks

    File: :file:`determinants_bitmasks.irp.f`

    Number of double excitation bitmasks




.. c:var:: n_occ_pattern

    .. code:: text

        integer(bit_kind), allocatable	:: psi_occ_pattern	(N_int,2,psi_det_size)
        integer	:: n_occ_pattern

    File: :file:`occ_pattern.irp.f`

    Array of the occ_patterns present in the wave function. 

    psi_occ_pattern(:,1,j) = j-th occ_pattern of the wave function : represents all the single occupations 

    psi_occ_pattern(:,2,j) = j-th occ_pattern of the wave function : represents all the double occupations 

    The occ patterns are sorted by :c:func:`occ_pattern_search_key`




.. c:var:: n_single_exc_bitmasks

    .. code:: text

        integer	:: n_single_exc_bitmasks

    File: :file:`determinants_bitmasks.irp.f`

    Number of single excitation bitmasks




.. c:var:: one_body_dm_ao_alpha

    .. code:: text

        double precision, allocatable	:: one_body_dm_ao_alpha	(ao_num,ao_num)
        double precision, allocatable	:: one_body_dm_ao_beta	(ao_num,ao_num)

    File: :file:`density_matrix.irp.f`

    One body density matrix on the |AO| basis :  :math:`\rho_{AO}(\alpha), \rho_{AO}(\beta)` .




.. c:var:: one_body_dm_ao_beta

    .. code:: text

        double precision, allocatable	:: one_body_dm_ao_alpha	(ao_num,ao_num)
        double precision, allocatable	:: one_body_dm_ao_beta	(ao_num,ao_num)

    File: :file:`density_matrix.irp.f`

    One body density matrix on the |AO| basis :  :math:`\rho_{AO}(\alpha), \rho_{AO}(\beta)` .




.. c:var:: one_body_dm_dagger_mo_spin_index

    .. code:: text

        double precision, allocatable	:: one_body_dm_dagger_mo_spin_index	(mo_num,mo_num,N_states,2)

    File: :file:`density_matrix.irp.f`

    




.. c:var:: one_body_dm_mo

    .. code:: text

        double precision, allocatable	:: one_body_dm_mo	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

    One-body density matrix




.. c:var:: one_body_dm_mo_alpha

    .. code:: text

        double precision, allocatable	:: one_body_dm_mo_alpha	(mo_num,mo_num,N_states)
        double precision, allocatable	:: one_body_dm_mo_beta	(mo_num,mo_num,N_states)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_body_dm_mo_alpha_average

    .. code:: text

        double precision, allocatable	:: one_body_dm_mo_alpha_average	(mo_num,mo_num)
        double precision, allocatable	:: one_body_dm_mo_beta_average	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_body_dm_mo_beta

    .. code:: text

        double precision, allocatable	:: one_body_dm_mo_alpha	(mo_num,mo_num,N_states)
        double precision, allocatable	:: one_body_dm_mo_beta	(mo_num,mo_num,N_states)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_body_dm_mo_beta_average

    .. code:: text

        double precision, allocatable	:: one_body_dm_mo_alpha_average	(mo_num,mo_num)
        double precision, allocatable	:: one_body_dm_mo_beta_average	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_body_dm_mo_diff

    .. code:: text

        double precision, allocatable	:: one_body_dm_mo_diff	(mo_num,mo_num,2:N_states)

    File: :file:`density_matrix.irp.f`

    Difference of the one-body density matrix with respect to the ground state




.. c:var:: one_body_dm_mo_spin_index

    .. code:: text

        double precision, allocatable	:: one_body_dm_mo_spin_index	(mo_num,mo_num,N_states,2)

    File: :file:`density_matrix.irp.f`

    




.. c:var:: one_body_single_double_dm_mo_alpha

    .. code:: text

        double precision, allocatable	:: one_body_single_double_dm_mo_alpha	(mo_num,mo_num)
        double precision, allocatable	:: one_body_single_double_dm_mo_beta	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_body_single_double_dm_mo_beta

    .. code:: text

        double precision, allocatable	:: one_body_single_double_dm_mo_alpha	(mo_num,mo_num)
        double precision, allocatable	:: one_body_single_double_dm_mo_beta	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_body_spin_density_ao

    .. code:: text

        double precision, allocatable	:: one_body_spin_density_ao	(ao_num,ao_num)

    File: :file:`density_matrix.irp.f`

    One body spin density matrix on the |AO| basis :  :math:`\rho_{AO}(\alpha) - \rho_{AO}(\beta)`




.. c:var:: one_body_spin_density_mo

    .. code:: text

        double precision, allocatable	:: one_body_spin_density_mo	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

     :math:`\rho(\alpha) - \rho(\beta)`




.. c:var:: one_e_dm_ao_alpha

    .. code:: text

        double precision, allocatable	:: one_e_dm_ao_alpha	(ao_num,ao_num)
        double precision, allocatable	:: one_e_dm_ao_beta	(ao_num,ao_num)

    File: :file:`density_matrix.irp.f`

    One body density matrix on the |AO| basis :  :math:`\rho_{AO}(\alpha), \rho_{AO}(\beta)` .




.. c:var:: one_e_dm_ao_beta

    .. code:: text

        double precision, allocatable	:: one_e_dm_ao_alpha	(ao_num,ao_num)
        double precision, allocatable	:: one_e_dm_ao_beta	(ao_num,ao_num)

    File: :file:`density_matrix.irp.f`

    One body density matrix on the |AO| basis :  :math:`\rho_{AO}(\alpha), \rho_{AO}(\beta)` .




.. c:var:: one_e_dm_dagger_mo_spin_index

    .. code:: text

        double precision, allocatable	:: one_e_dm_dagger_mo_spin_index	(mo_num,mo_num,N_states,2)

    File: :file:`density_matrix.irp.f`

    




.. c:var:: one_e_dm_mo

    .. code:: text

        double precision, allocatable	:: one_e_dm_mo	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

    One-body density matrix




.. c:var:: one_e_dm_mo_alpha

    .. code:: text

        double precision, allocatable	:: one_e_dm_mo_alpha	(mo_num,mo_num,N_states)
        double precision, allocatable	:: one_e_dm_mo_beta	(mo_num,mo_num,N_states)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_e_dm_mo_alpha_average

    .. code:: text

        double precision, allocatable	:: one_e_dm_mo_alpha_average	(mo_num,mo_num)
        double precision, allocatable	:: one_e_dm_mo_beta_average	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_e_dm_mo_beta

    .. code:: text

        double precision, allocatable	:: one_e_dm_mo_alpha	(mo_num,mo_num,N_states)
        double precision, allocatable	:: one_e_dm_mo_beta	(mo_num,mo_num,N_states)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_e_dm_mo_beta_average

    .. code:: text

        double precision, allocatable	:: one_e_dm_mo_alpha_average	(mo_num,mo_num)
        double precision, allocatable	:: one_e_dm_mo_beta_average	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

     :math:`\alpha`  and  :math:`\beta`  one-body density matrix for each state




.. c:var:: one_e_dm_mo_diff

    .. code:: text

        double precision, allocatable	:: one_e_dm_mo_diff	(mo_num,mo_num,2:N_states)

    File: :file:`density_matrix.irp.f`

    Difference of the one-body density matrix with respect to the ground state




.. c:var:: one_e_dm_mo_spin_index

    .. code:: text

        double precision, allocatable	:: one_e_dm_mo_spin_index	(mo_num,mo_num,N_states,2)

    File: :file:`density_matrix.irp.f`

    




.. c:var:: one_e_spin_density_ao

    .. code:: text

        double precision, allocatable	:: one_e_spin_density_ao	(ao_num,ao_num)

    File: :file:`density_matrix.irp.f`

    One body spin density matrix on the |AO| basis :  :math:`\rho_{AO}(\alpha) - \rho_{AO}(\beta)`




.. c:var:: one_e_spin_density_mo

    .. code:: text

        double precision, allocatable	:: one_e_spin_density_mo	(mo_num,mo_num)

    File: :file:`density_matrix.irp.f`

     :math:`\rho(\alpha) - \rho(\beta)`




.. c:var:: psi_average_norm_contrib

    .. code:: text

        double precision, allocatable	:: psi_average_norm_contrib	(psi_det_size)

    File: :file:`determinants.irp.f`

    Contribution of determinants to the state-averaged density.




.. c:var:: psi_average_norm_contrib_sorted

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_sorted	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_coef_sorted	(psi_det_size,N_states)
        double precision, allocatable	:: psi_average_norm_contrib_sorted	(psi_det_size)
        integer, allocatable	:: psi_det_sorted_order	(psi_det_size)

    File: :file:`determinants.irp.f`

    Wave function sorted by determinants contribution to the norm (state-averaged) 

    psi_det_sorted_order(i) -> k : index in psi_det




.. c:var:: psi_bilinear_matrix

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix	(N_det_alpha_unique,N_det_beta_unique,N_states)

    File: :file:`spindeterminants.irp.f`

    Coefficient matrix if the wave function is expressed in a bilinear form : 

     :math:`D_\alpha^\dagger.C.D_\beta`




.. c:var:: psi_bilinear_matrix_columns

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix_values	(N_det,N_states)
        integer, allocatable	:: psi_bilinear_matrix_rows	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_columns	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_order	(N_det)

    File: :file:`spindeterminants.irp.f`

    Sparse coefficient matrix if the wave function is expressed in a bilinear form :  :math:`D_\alpha^\dagger.C.D_\beta` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` . 

    Order refers to psi_det




.. c:var:: psi_bilinear_matrix_columns_loc

    .. code:: text

        integer, allocatable	:: psi_bilinear_matrix_columns_loc	(N_det_beta_unique+1)

    File: :file:`spindeterminants.irp.f`

    Sparse coefficient matrix if the wave function is expressed in a bilinear form : 

     :math:`D_\alpha^\dagger.C.D_\beta` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` . 

    Order refers to ``psi_det``




.. c:var:: psi_bilinear_matrix_order

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix_values	(N_det,N_states)
        integer, allocatable	:: psi_bilinear_matrix_rows	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_columns	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_order	(N_det)

    File: :file:`spindeterminants.irp.f`

    Sparse coefficient matrix if the wave function is expressed in a bilinear form :  :math:`D_\alpha^\dagger.C.D_\beta` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` . 

    Order refers to psi_det




.. c:var:: psi_bilinear_matrix_order_reverse

    .. code:: text

        integer, allocatable	:: psi_bilinear_matrix_order_reverse	(N_det)

    File: :file:`spindeterminants.irp.f`

    Order which allows to go from ``psi_bilinear_matrix`` to ``psi_det``




.. c:var:: psi_bilinear_matrix_order_transp_reverse

    .. code:: text

        integer, allocatable	:: psi_bilinear_matrix_order_transp_reverse	(N_det)

    File: :file:`spindeterminants.irp.f`

    Order which allows to go from ``psi_bilinear_matrix_order_transp`` to ``psi_bilinear_matrix``




.. c:var:: psi_bilinear_matrix_rows

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix_values	(N_det,N_states)
        integer, allocatable	:: psi_bilinear_matrix_rows	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_columns	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_order	(N_det)

    File: :file:`spindeterminants.irp.f`

    Sparse coefficient matrix if the wave function is expressed in a bilinear form :  :math:`D_\alpha^\dagger.C.D_\beta` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` . 

    Order refers to psi_det




.. c:var:: psi_bilinear_matrix_transp_columns

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix_transp_values	(N_det,N_states)
        integer, allocatable	:: psi_bilinear_matrix_transp_rows	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_transp_columns	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_transp_order	(N_det)

    File: :file:`spindeterminants.irp.f`

    Transpose of ``psi_bilinear_matrix`` 

     :math:`D_\beta^\dagger.C^\dagger.D_\alpha` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` , but the matrix is stored in row major format.




.. c:var:: psi_bilinear_matrix_transp_order

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix_transp_values	(N_det,N_states)
        integer, allocatable	:: psi_bilinear_matrix_transp_rows	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_transp_columns	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_transp_order	(N_det)

    File: :file:`spindeterminants.irp.f`

    Transpose of ``psi_bilinear_matrix`` 

     :math:`D_\beta^\dagger.C^\dagger.D_\alpha` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` , but the matrix is stored in row major format.




.. c:var:: psi_bilinear_matrix_transp_rows

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix_transp_values	(N_det,N_states)
        integer, allocatable	:: psi_bilinear_matrix_transp_rows	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_transp_columns	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_transp_order	(N_det)

    File: :file:`spindeterminants.irp.f`

    Transpose of ``psi_bilinear_matrix`` 

     :math:`D_\beta^\dagger.C^\dagger.D_\alpha` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` , but the matrix is stored in row major format.




.. c:var:: psi_bilinear_matrix_transp_rows_loc

    .. code:: text

        integer, allocatable	:: psi_bilinear_matrix_transp_rows_loc	(N_det_alpha_unique+1)

    File: :file:`spindeterminants.irp.f`

    Location of the columns in the ``psi_bilinear_matrix``




.. c:var:: psi_bilinear_matrix_transp_values

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix_transp_values	(N_det,N_states)
        integer, allocatable	:: psi_bilinear_matrix_transp_rows	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_transp_columns	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_transp_order	(N_det)

    File: :file:`spindeterminants.irp.f`

    Transpose of ``psi_bilinear_matrix`` 

     :math:`D_\beta^\dagger.C^\dagger.D_\alpha` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` , but the matrix is stored in row major format.




.. c:var:: psi_bilinear_matrix_values

    .. code:: text

        double precision, allocatable	:: psi_bilinear_matrix_values	(N_det,N_states)
        integer, allocatable	:: psi_bilinear_matrix_rows	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_columns	(N_det)
        integer, allocatable	:: psi_bilinear_matrix_order	(N_det)

    File: :file:`spindeterminants.irp.f`

    Sparse coefficient matrix if the wave function is expressed in a bilinear form :  :math:`D_\alpha^\dagger.C.D_\beta` 

    Rows are  :math:`\alpha`  determinants and columns are  :math:`\beta` . 

    Order refers to psi_det




.. c:var:: psi_cas

    .. code:: text

        integer(bit_kind), allocatable	:: psi_cas	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_cas_coef	(psi_det_size,n_states)
        integer, allocatable	:: idx_cas	(psi_det_size)
        integer	:: n_det_cas

    File: :file:`psi_cas.irp.f`

    |CAS| wave function, defined from the application of the |CAS| bitmask on the determinants. idx_cas gives the indice of the |CAS| determinant in psi_det.




.. c:var:: psi_cas_coef

    .. code:: text

        integer(bit_kind), allocatable	:: psi_cas	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_cas_coef	(psi_det_size,n_states)
        integer, allocatable	:: idx_cas	(psi_det_size)
        integer	:: n_det_cas

    File: :file:`psi_cas.irp.f`

    |CAS| wave function, defined from the application of the |CAS| bitmask on the determinants. idx_cas gives the indice of the |CAS| determinant in psi_det.




.. c:var:: psi_cas_coef_sorted_bit

    .. code:: text

        integer(bit_kind), allocatable	:: psi_cas_sorted_bit	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_cas_coef_sorted_bit	(psi_det_size,N_states)

    File: :file:`psi_cas.irp.f`

    |CAS| determinants sorted to accelerate the search of a random determinant in the wave function.




.. c:var:: psi_cas_energy

    .. code:: text

        double precision, allocatable	:: psi_cas_energy	(N_states)

    File: :file:`psi_cas.irp.f`

    Variational energy of  :math:`\Psi_{CAS}` , where  :math:`\Psi_{CAS} =  \sum_{I \in CAS} \I \rangle \langle I | \Psi \rangle` .




.. c:var:: psi_cas_energy_diagonalized

    .. code:: text

        double precision, allocatable	:: psi_coef_cas_diagonalized	(N_det_cas,N_states)
        double precision, allocatable	:: psi_cas_energy_diagonalized	(N_states)

    File: :file:`psi_cas.irp.f`

    




.. c:var:: psi_cas_sorted_bit

    .. code:: text

        integer(bit_kind), allocatable	:: psi_cas_sorted_bit	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_cas_coef_sorted_bit	(psi_det_size,N_states)

    File: :file:`psi_cas.irp.f`

    |CAS| determinants sorted to accelerate the search of a random determinant in the wave function.




.. c:var:: psi_coef

    .. code:: text

        double precision, allocatable	:: psi_coef	(psi_det_size,N_states)

    File: :file:`determinants.irp.f`

    The wave function coefficients. Initialized with Hartree-Fock if the |EZFIO| file is empty.




.. c:var:: psi_coef_cas_diagonalized

    .. code:: text

        double precision, allocatable	:: psi_coef_cas_diagonalized	(N_det_cas,N_states)
        double precision, allocatable	:: psi_cas_energy_diagonalized	(N_states)

    File: :file:`psi_cas.irp.f`

    




.. c:var:: psi_coef_max

    .. code:: text

        double precision, allocatable	:: psi_coef_max	(N_states)
        double precision, allocatable	:: psi_coef_min	(N_states)
        double precision, allocatable	:: abs_psi_coef_max	(N_states)
        double precision, allocatable	:: abs_psi_coef_min	(N_states)

    File: :file:`determinants.irp.f`

    Max and min values of the coefficients




.. c:var:: psi_coef_min

    .. code:: text

        double precision, allocatable	:: psi_coef_max	(N_states)
        double precision, allocatable	:: psi_coef_min	(N_states)
        double precision, allocatable	:: abs_psi_coef_max	(N_states)
        double precision, allocatable	:: abs_psi_coef_min	(N_states)

    File: :file:`determinants.irp.f`

    Max and min values of the coefficients




.. c:var:: psi_coef_sorted

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_sorted	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_coef_sorted	(psi_det_size,N_states)
        double precision, allocatable	:: psi_average_norm_contrib_sorted	(psi_det_size)
        integer, allocatable	:: psi_det_sorted_order	(psi_det_size)

    File: :file:`determinants.irp.f`

    Wave function sorted by determinants contribution to the norm (state-averaged) 

    psi_det_sorted_order(i) -> k : index in psi_det




.. c:var:: psi_coef_sorted_bit

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_sorted_bit	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_coef_sorted_bit	(psi_det_size,N_states)

    File: :file:`determinants.irp.f`

    Determinants on which we apply  :math:`\langle i|H|psi \rangle`  for perturbation. They are sorted by determinants interpreted as integers. Useful to accelerate the search of a random determinant in the wave function.




.. c:var:: psi_det

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det	(N_int,2,psi_det_size)

    File: :file:`determinants.irp.f`

    The determinants of the wave function. Initialized with Hartree-Fock if the |EZFIO| file is empty.




.. c:var:: psi_det_alpha

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_alpha	(N_int,psi_det_size)

    File: :file:`spindeterminants.irp.f`

    List of  :math:`\alpha`  determinants of psi_det




.. c:var:: psi_det_alpha_unique

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_alpha_unique	(N_int,psi_det_size)
        integer	:: n_det_alpha_unique

    File: :file:`spindeterminants.irp.f_template_144`

    Unique  :math:`\alpha`  determinants




.. c:var:: psi_det_beta

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_beta	(N_int,psi_det_size)

    File: :file:`spindeterminants.irp.f`

    List of  :math:`\beta`  determinants of psi_det




.. c:var:: psi_det_beta_unique

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_beta_unique	(N_int,psi_det_size)
        integer	:: n_det_beta_unique

    File: :file:`spindeterminants.irp.f_template_144`

    Unique  :math:`\beta`  determinants




.. c:var:: psi_det_hii

    .. code:: text

        double precision, allocatable	:: psi_det_hii	(N_det)

    File: :file:`determinants.irp.f`

     :math:`\langle i|h|i \rangle`  for all determinants.




.. c:var:: psi_det_size

    .. code:: text

        integer	:: psi_det_size

    File: :file:`determinants.irp.f`

    Size of the psi_det and psi_coef arrays




.. c:var:: psi_det_sorted

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_sorted	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_coef_sorted	(psi_det_size,N_states)
        double precision, allocatable	:: psi_average_norm_contrib_sorted	(psi_det_size)
        integer, allocatable	:: psi_det_sorted_order	(psi_det_size)

    File: :file:`determinants.irp.f`

    Wave function sorted by determinants contribution to the norm (state-averaged) 

    psi_det_sorted_order(i) -> k : index in psi_det




.. c:var:: psi_det_sorted_bit

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_sorted_bit	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_coef_sorted_bit	(psi_det_size,N_states)

    File: :file:`determinants.irp.f`

    Determinants on which we apply  :math:`\langle i|H|psi \rangle`  for perturbation. They are sorted by determinants interpreted as integers. Useful to accelerate the search of a random determinant in the wave function.




.. c:var:: psi_det_sorted_order

    .. code:: text

        integer(bit_kind), allocatable	:: psi_det_sorted	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_coef_sorted	(psi_det_size,N_states)
        double precision, allocatable	:: psi_average_norm_contrib_sorted	(psi_det_size)
        integer, allocatable	:: psi_det_sorted_order	(psi_det_size)

    File: :file:`determinants.irp.f`

    Wave function sorted by determinants contribution to the norm (state-averaged) 

    psi_det_sorted_order(i) -> k : index in psi_det




.. c:var:: psi_energy_h_core

    .. code:: text

        double precision, allocatable	:: psi_energy_h_core	(N_states)

    File: :file:`psi_energy_mono_elec.irp.f`

    psi_energy_h_core =  :math:`\langle \Psi | h_{core} |\Psi \rangle` 

    computed using the :c:data:`one_e_dm_mo_alpha` + :c:data:`one_e_dm_mo_beta` and :c:data:`mo_one_e_integrals`




.. c:var:: psi_non_cas

    .. code:: text

        integer(bit_kind), allocatable	:: psi_non_cas	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_non_cas_coef	(psi_det_size,n_states)
        integer, allocatable	:: idx_non_cas	(psi_det_size)
        integer	:: n_det_non_cas

    File: :file:`psi_cas.irp.f`

    Set of determinants which are not part of the |CAS|, defined from the application of the |CAS| bitmask on the determinants. idx_non_cas gives the indice of the determinant in psi_det.




.. c:var:: psi_non_cas_coef

    .. code:: text

        integer(bit_kind), allocatable	:: psi_non_cas	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_non_cas_coef	(psi_det_size,n_states)
        integer, allocatable	:: idx_non_cas	(psi_det_size)
        integer	:: n_det_non_cas

    File: :file:`psi_cas.irp.f`

    Set of determinants which are not part of the |CAS|, defined from the application of the |CAS| bitmask on the determinants. idx_non_cas gives the indice of the determinant in psi_det.




.. c:var:: psi_non_cas_coef_sorted_bit

    .. code:: text

        integer(bit_kind), allocatable	:: psi_non_cas_sorted_bit	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_non_cas_coef_sorted_bit	(psi_det_size,N_states)

    File: :file:`psi_cas.irp.f`

    |CAS| determinants sorted to accelerate the search of a random determinant in the wave function.




.. c:var:: psi_non_cas_sorted_bit

    .. code:: text

        integer(bit_kind), allocatable	:: psi_non_cas_sorted_bit	(N_int,2,psi_det_size)
        double precision, allocatable	:: psi_non_cas_coef_sorted_bit	(psi_det_size,N_states)

    File: :file:`psi_cas.irp.f`

    |CAS| determinants sorted to accelerate the search of a random determinant in the wave function.




.. c:var:: psi_occ_pattern

    .. code:: text

        integer(bit_kind), allocatable	:: psi_occ_pattern	(N_int,2,psi_det_size)
        integer	:: n_occ_pattern

    File: :file:`occ_pattern.irp.f`

    Array of the occ_patterns present in the wave function. 

    psi_occ_pattern(:,1,j) = j-th occ_pattern of the wave function : represents all the single occupations 

    psi_occ_pattern(:,2,j) = j-th occ_pattern of the wave function : represents all the double occupations 

    The occ patterns are sorted by :c:func:`occ_pattern_search_key`




.. c:var:: psi_occ_pattern_hii

    .. code:: text

        double precision, allocatable	:: psi_occ_pattern_hii	(N_occ_pattern)

    File: :file:`occ_pattern.irp.f`

     :math:`\langle I|H|I \rangle`  where  :math:`|I\rangle`  is an occupation pattern. This is the minimum  :math:`H_{ii}` , where the  :math:`|i\rangle`  are the determinants of  :math:`|I\rangle` .




.. c:var:: ref_bitmask_e_n_energy

    .. code:: text

        double precision	:: ref_bitmask_energy
        double precision	:: ref_bitmask_one_e_energy
        double precision	:: ref_bitmask_kinetic_energy
        double precision	:: ref_bitmask_e_n_energy
        double precision	:: ref_bitmask_two_e_energy

    File: :file:`ref_bitmask.irp.f`

    Energy of the reference bitmask used in Slater rules




.. c:var:: ref_bitmask_energy

    .. code:: text

        double precision	:: ref_bitmask_energy
        double precision	:: ref_bitmask_one_e_energy
        double precision	:: ref_bitmask_kinetic_energy
        double precision	:: ref_bitmask_e_n_energy
        double precision	:: ref_bitmask_two_e_energy

    File: :file:`ref_bitmask.irp.f`

    Energy of the reference bitmask used in Slater rules




.. c:var:: ref_bitmask_kinetic_energy

    .. code:: text

        double precision	:: ref_bitmask_energy
        double precision	:: ref_bitmask_one_e_energy
        double precision	:: ref_bitmask_kinetic_energy
        double precision	:: ref_bitmask_e_n_energy
        double precision	:: ref_bitmask_two_e_energy

    File: :file:`ref_bitmask.irp.f`

    Energy of the reference bitmask used in Slater rules




.. c:var:: ref_bitmask_one_e_energy

    .. code:: text

        double precision	:: ref_bitmask_energy
        double precision	:: ref_bitmask_one_e_energy
        double precision	:: ref_bitmask_kinetic_energy
        double precision	:: ref_bitmask_e_n_energy
        double precision	:: ref_bitmask_two_e_energy

    File: :file:`ref_bitmask.irp.f`

    Energy of the reference bitmask used in Slater rules




.. c:var:: ref_bitmask_two_e_energy

    .. code:: text

        double precision	:: ref_bitmask_energy
        double precision	:: ref_bitmask_one_e_energy
        double precision	:: ref_bitmask_kinetic_energy
        double precision	:: ref_bitmask_e_n_energy
        double precision	:: ref_bitmask_two_e_energy

    File: :file:`ref_bitmask.irp.f`

    Energy of the reference bitmask used in Slater rules




.. c:var:: ref_closed_shell_bitmask

    .. code:: text

        integer(bit_kind), allocatable	:: ref_closed_shell_bitmask	(N_int,2)

    File: :file:`single_excitations.irp.f`

    




.. c:var:: s2_matrix_all_dets

    .. code:: text

        double precision, allocatable	:: s2_matrix_all_dets	(N_det,N_det)

    File: :file:`utils.irp.f`

    |S^2| matrix on the basis of the Slater determinants defined by psi_det




.. c:var:: s2_values

    .. code:: text

        double precision, allocatable	:: s2_values	(N_states)

    File: :file:`s2.irp.f`

    array of the averaged values of the S^2 operator on the various states




.. c:var:: s_z

    .. code:: text

        double precision	:: s_z
        double precision	:: s_z2_sz

    File: :file:`s2.irp.f`

    z component of the Spin




.. c:var:: s_z2_sz

    .. code:: text

        double precision	:: s_z
        double precision	:: s_z2_sz

    File: :file:`s2.irp.f`

    z component of the Spin




.. c:var:: single_exc_bitmask

    .. code:: text

        integer(bit_kind), allocatable	:: single_exc_bitmask	(N_int,2,N_single_exc_bitmasks)

    File: :file:`determinants_bitmasks.irp.f`

    single_exc_bitmask(:,1,i) is the bitmask for holes 

    single_exc_bitmask(:,2,i) is the bitmask for particles 

    for a given couple of hole/particle excitations i.




.. c:var:: singles_alpha_csc

    .. code:: text

        integer, allocatable	:: singles_alpha_csc	(singles_alpha_csc_size)

    File: :file:`spindeterminants.irp.f`

    Dimension of the singles_alpha array




.. c:var:: singles_alpha_csc_idx

    .. code:: text

        integer*8, allocatable	:: singles_alpha_csc_idx	(N_det_alpha_unique+1)
        integer*8	:: singles_alpha_csc_size

    File: :file:`spindeterminants.irp.f`

    Dimension of the ``singles_alpha`` array




.. c:var:: singles_alpha_csc_size

    .. code:: text

        integer*8, allocatable	:: singles_alpha_csc_idx	(N_det_alpha_unique+1)
        integer*8	:: singles_alpha_csc_size

    File: :file:`spindeterminants.irp.f`

    Dimension of the ``singles_alpha`` array




.. c:var:: singles_alpha_size

    .. code:: text

        integer	:: singles_alpha_size

    File: :file:`spindeterminants.irp.f`

    Dimension of the ``singles_alpha`` array




.. c:var:: state_average_weight

    .. code:: text

        double precision, allocatable	:: state_average_weight	(N_states)

    File: :file:`density_matrix.irp.f`

    Weights in the state-average calculation of the density matrix




.. c:var:: weight_occ_pattern

    .. code:: text

        double precision, allocatable	:: weight_occ_pattern	(N_occ_pattern,N_states)

    File: :file:`occ_pattern.irp.f`

    Weight of the occupation patterns in the wave function




Subroutines / functions
-----------------------



.. c:function:: a_operator

    .. code:: text

        subroutine a_operator(iorb,ispin,key,hjj,Nint,na,nb)

    File: :file:`slater_rules.irp.f`

    Needed for :c:func:`diag_H_mat_elem`.





.. c:function:: a_operator_two_e

    .. code:: text

        subroutine a_operator_two_e(iorb,ispin,key,hjj,Nint,na,nb)

    File: :file:`slater_rules_wee_mono.irp.f`

    Needed for :c:func:`diag_Wee_mat_elem`.





.. c:function:: ac_operator

    .. code:: text

        subroutine ac_operator(iorb,ispin,key,hjj,Nint,na,nb)

    File: :file:`slater_rules.irp.f`

    Needed for :c:func:`diag_H_mat_elem`.





.. c:function:: ac_operator_two_e

    .. code:: text

        subroutine ac_operator_two_e(iorb,ispin,key,hjj,Nint,na,nb)

    File: :file:`slater_rules_wee_mono.irp.f`

    Needed for :c:func:`diag_Wee_mat_elem`.





.. c:function:: apply_excitation

    .. code:: text

        subroutine apply_excitation(det, exc, res, ok, Nint)

    File: :file:`determinants.irp.f`

    





.. c:function:: apply_hole

    .. code:: text

        subroutine apply_hole(det, s1, h1, res, ok, Nint)

    File: :file:`determinants.irp.f`

    





.. c:function:: apply_holes

    .. code:: text

        subroutine apply_holes(det, s1, h1, s2, h2, res, ok, Nint)

    File: :file:`determinants.irp.f`

    





.. c:function:: apply_particle

    .. code:: text

        subroutine apply_particle(det, s1, p1, res, ok, Nint)

    File: :file:`determinants.irp.f`

    





.. c:function:: apply_particles

    .. code:: text

        subroutine apply_particles(det, s1, p1, s2, p2, res, ok, Nint)

    File: :file:`determinants.irp.f`

    





.. c:function:: au0_h_au0

    .. code:: text

        subroutine au0_h_au0(energies,psi_in,psi_in_coef,ndet,dim_psi_coef)

    File: :file:`mo_energy_expval.irp.f`

    





.. c:function:: bitstring_to_list_ab

    .. code:: text

        subroutine bitstring_to_list_ab( string, list, n_elements, Nint)

    File: :file:`slater_rules.irp.f`

    Gives the inidices(+1) of the bits set to 1 in the bit string For alpha/beta determinants.





.. c:function:: build_fock_tmp

    .. code:: text

        subroutine build_fock_tmp(fock_diag_tmp,det_ref,Nint)

    File: :file:`fock_diag.irp.f`

    Build the diagonal of the Fock matrix corresponding to a generator determinant.  :math:`F_{00}`  is  :math:`\langle i|H|i \rangle = E_0` .





.. c:function:: connected_to_ref

    .. code:: text

        integer function connected_to_ref(key,keys,Nint,N_past_in,Ndet)

    File: :file:`connected_to_ref.irp.f`

    input  : key : a given Slater determinant 

    : keys: a list of Slater determinants 

    : Ndet: the number of Slater determinants in keys 

    : N_past_in the number of Slater determinants for the connectivity research 

    output :   0 : key not connected to the N_past_in first Slater determinants in keys 

    i : key is connected to determinant i of keys 

    -i : key is the ith determinant of the reference wf keys





.. c:function:: connected_to_ref_by_mono

    .. code:: text

        integer function connected_to_ref_by_mono(key,keys,Nint,N_past_in,Ndet)

    File: :file:`connected_to_ref.irp.f`

    Returns |true| is ``key`` is connected to the reference by a single excitation. input  : key : a given Slater determinant 

    : keys: a list of Slater determinants 

    : Ndet: the number of Slater determinants in keys 

    : N_past_in the number of Slater determinants for the connectivity research 

    output :   0 : key not connected by a MONO EXCITATION to the N_past_in first Slater determinants in keys 

    i : key is connected by a MONO EXCITATION to determinant i of keys 

    -i : key is the ith determinant of the reference wf keys





.. c:function:: copy_h_apply_buffer_to_wf

    .. code:: text

        subroutine copy_H_apply_buffer_to_wf

    File: :file:`h_apply.irp.f`

    Copies the H_apply buffer to psi_coef. After calling this subroutine, N_det, psi_det and psi_coef need to be touched





.. c:function:: copy_psi_bilinear_to_psi

    .. code:: text

        subroutine copy_psi_bilinear_to_psi(psi, isize)

    File: :file:`spindeterminants.irp.f`

    Overwrites ``psi_det`` and ``psi_coef`` with the wave function in bilinear order





.. c:function:: create_microlist

    .. code:: text

        subroutine create_microlist(minilist, N_minilist, key_mask, microlist, idx_microlist, N_microlist, ptr_microlist, Nint)

    File: :file:`filter_connected.irp.f`

    





.. c:function:: create_minilist

    .. code:: text

        subroutine create_minilist(key_mask, fullList, miniList, idx_miniList, N_fullList, N_miniList, Nint)

    File: :file:`slater_rules.irp.f`

    





.. c:function:: create_minilist_find_previous

    .. code:: text

        subroutine create_minilist_find_previous(key_mask, fullList, miniList, N_fullList, N_miniList, fullMatch, Nint)

    File: :file:`slater_rules.irp.f`

    





.. c:function:: create_wf_of_psi_bilinear_matrix

    .. code:: text

        subroutine create_wf_of_psi_bilinear_matrix(truncate)

    File: :file:`spindeterminants.irp.f`

    Generates a wave function containing all possible products of  :math:`\alpha`  and  :math:`\beta`  determinants





.. c:function:: decode_exc

    .. code:: text

        subroutine decode_exc(exc,degree,h1,p1,h2,p2,s1,s2)

    File: :file:`slater_rules.irp.f`

    Decodes the exc arrays returned by get_excitation. h1,h2 : Holes p1,p2 : Particles s1,s2 : Spins (1:alpha, 2:beta) degree : Degree of excitation





.. c:function:: decode_exc_spin

    .. code:: text

        subroutine decode_exc_spin(exc,h1,p1,h2,p2)

    File: :file:`slater_rules.irp.f`

    Decodes the exc arrays returned by get_excitation. 

    h1,h2 : Holes 

    p1,p2 : Particles





.. c:function:: det_inf

    .. code:: text

        logical function det_inf(key1, key2, Nint)

    File: :file:`sort_dets_ab.irp.f`

    Ordering function for determinants.





.. c:function:: det_search_key

    .. code:: text

        integer*8 function det_search_key(det,Nint)

    File: :file:`connected_to_ref.irp.f`

    Return an integer*8 corresponding to a determinant index for searching





.. c:function:: detcmp

    .. code:: text

        integer function detCmp(a,b,Nint)

    File: :file:`determinants.irp.f`

    





.. c:function:: deteq

    .. code:: text

        logical function detEq(a,b,Nint)

    File: :file:`determinants.irp.f`

    





.. c:function:: diag_h_mat_elem

    .. code:: text

        double precision function diag_H_mat_elem(det_in,Nint)

    File: :file:`slater_rules.irp.f`

    Computes  :math:`\langle i|H|i \rangle` .





.. c:function:: diag_h_mat_elem_au0_h_au0

    .. code:: text

        subroutine diag_H_mat_elem_au0_h_au0(det_in,Nint,hii)

    File: :file:`mo_energy_expval.irp.f`

    Computes  :math:`\langle i|H|i \rangle`  for any determinant  :math:`|i\rangle` . Used for wave functions with an additional electron.





.. c:function:: diag_h_mat_elem_fock

    .. code:: text

        double precision function diag_H_mat_elem_fock(det_ref,det_pert,fock_diag_tmp,Nint)

    File: :file:`slater_rules.irp.f`

    Computes  :math:`\langle i|H|i \rangle`  when  :math:`i`  is at most a double excitation from a reference.





.. c:function:: diag_h_mat_elem_one_e

    .. code:: text

        double precision function diag_H_mat_elem_one_e(det_in,Nint)

    File: :file:`slater_rules_wee_mono.irp.f`

    Computes  :math:`\langle i|H|i \rangle` .





.. c:function:: diag_s_mat_elem

    .. code:: text

        double precision function diag_S_mat_elem(key_i,Nint)

    File: :file:`s2.irp.f`

    Returns <i|S^2|i>





.. c:function:: diag_wee_mat_elem

    .. code:: text

        double precision function diag_wee_mat_elem(det_in,Nint)

    File: :file:`slater_rules_wee_mono.irp.f`

    Computes  :math:`\langle i|H|i \rangle` .





.. c:function:: do_mono_excitation

    .. code:: text

        subroutine do_mono_excitation(key_in,i_hole,i_particle,ispin,i_ok)

    File: :file:`create_excitations.irp.f`

    Apply the single excitation operator : a^{dager}_(i_particle) a_(i_hole) of spin = ispin on key_in ispin = 1  == alpha ispin = 2  == beta i_ok = 1  == the excitation is possible i_ok = -1 == the excitation is not possible





.. c:function:: example_determinants

    .. code:: text

        subroutine example_determinants

    File: :file:`example.irp.f`

    subroutine that illustrates the main features available in determinants





.. c:function:: example_determinants_psi_det

    .. code:: text

        subroutine example_determinants_psi_det

    File: :file:`example.irp.f`

    subroutine that illustrates the main features available in determinants using the psi_det/psi_coef





.. c:function:: fill_h_apply_buffer_no_selection

    .. code:: text

        subroutine fill_H_apply_buffer_no_selection(n_selected,det_buffer,Nint,iproc)

    File: :file:`h_apply.irp.f`

    Fill the H_apply buffer with determiants for |CISD|





.. c:function:: filter_connected

    .. code:: text

        subroutine filter_connected(key1,key2,Nint,sze,idx)

    File: :file:`filter_connected.irp.f`

    Filters out the determinants that are not connected by H 

    returns the array idx which contains the index of the 

    determinants in the array key1 that interact 

    via the H operator with key2. 

    idx(0) is the number of determinants that interact with key1





.. c:function:: filter_connected_i_h_psi0

    .. code:: text

        subroutine filter_connected_i_H_psi0(key1,key2,Nint,sze,idx)

    File: :file:`filter_connected.irp.f`

    Returns the array idx which contains the index of the 

    determinants in the array key1 that interact 

    via the H operator with key2. 

    idx(0) is the number of determinants that interact with key1





.. c:function:: filter_not_connected

    .. code:: text

        subroutine filter_not_connected(key1,key2,Nint,sze,idx)

    File: :file:`filter_connected.irp.f`

    Returns the array idx which contains the index of the 

    determinants in the array key1 that DO NOT interact 

    via the H operator with key2. 

    idx(0) is the number of determinants that DO NOT interact with key1





.. c:function:: generate_all_alpha_beta_det_products

    .. code:: text

        subroutine generate_all_alpha_beta_det_products

    File: :file:`spindeterminants.irp.f`

    Creates a wave function from all possible  :math:`\alpha \times \beta`  determinants





.. c:function:: get_all_spin_doubles

    .. code:: text

        subroutine get_all_spin_doubles(buffer, idx, spindet, Nint, size_buffer, doubles, n_doubles)

    File: :file:`spindeterminants.irp.f`

    

    Returns the indices of all the double excitations in the list of unique  :math:`\alpha`  determinants. 







.. c:function:: get_all_spin_doubles_1

    .. code:: text

        subroutine get_all_spin_doubles_1(buffer, idx, spindet, size_buffer, doubles, n_doubles)

    File: :file:`spindeterminants.irp.f`

    

    Returns the indices of all the double excitations in the list of unique  :math:`\alpha`  determinants. 







.. c:function:: get_all_spin_doubles_2

    .. code:: text

        subroutine get_all_spin_doubles_2(buffer, idx, spindet, size_buffer, doubles, n_doubles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the double excitations in the list of unique  :math:`lpha`  determinants. 







.. c:function:: get_all_spin_doubles_3

    .. code:: text

        subroutine get_all_spin_doubles_3(buffer, idx, spindet, size_buffer, doubles, n_doubles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the double excitations in the list of unique  :math:`lpha`  determinants. 







.. c:function:: get_all_spin_doubles_4

    .. code:: text

        subroutine get_all_spin_doubles_4(buffer, idx, spindet, size_buffer, doubles, n_doubles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the double excitations in the list of unique  :math:`lpha`  determinants. 







.. c:function:: get_all_spin_doubles_n_int

    .. code:: text

        subroutine get_all_spin_doubles_N_int(buffer, idx, spindet, size_buffer, doubles, n_doubles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the double excitations in the list of unique  :math:`lpha`  determinants. 







.. c:function:: get_all_spin_singles

    .. code:: text

        subroutine get_all_spin_singles(buffer, idx, spindet, Nint, size_buffer, singles, n_singles)

    File: :file:`spindeterminants.irp.f`

    

    Returns the indices of all the single excitations in the list of unique  :math:`\alpha`  determinants. 







.. c:function:: get_all_spin_singles_1

    .. code:: text

        subroutine get_all_spin_singles_1(buffer, idx, spindet, size_buffer, singles, n_singles)

    File: :file:`spindeterminants.irp.f`

    

    Returns the indices of all the single excitations in the list of unique  :math:`\alpha`  determinants. 







.. c:function:: get_all_spin_singles_2

    .. code:: text

        subroutine get_all_spin_singles_2(buffer, idx, spindet, size_buffer, singles, n_singles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the single excitations in the list of unique  :math:`lpha`  determinants. 







.. c:function:: get_all_spin_singles_3

    .. code:: text

        subroutine get_all_spin_singles_3(buffer, idx, spindet, size_buffer, singles, n_singles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the single excitations in the list of unique  :math:`lpha`  determinants. 







.. c:function:: get_all_spin_singles_4

    .. code:: text

        subroutine get_all_spin_singles_4(buffer, idx, spindet, size_buffer, singles, n_singles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the single excitations in the list of unique  :math:`lpha`  determinants. 







.. c:function:: get_all_spin_singles_and_doubles

    .. code:: text

        subroutine get_all_spin_singles_and_doubles(buffer, idx, spindet, Nint, size_buffer, singles, doubles, n_singles, n_doubles)

    File: :file:`spindeterminants.irp.f`

    

    Returns the indices of all the single and double excitations in the list of unique  :math:`\alpha`  determinants. 

    Warning: The buffer is transposed. 







.. c:function:: get_all_spin_singles_and_doubles_1

    .. code:: text

        subroutine get_all_spin_singles_and_doubles_1(buffer, idx, spindet, size_buffer, singles, doubles, n_singles, n_doubles)

    File: :file:`spindeterminants.irp.f`

    

    Returns the indices of all the single and double excitations in the list of unique  :math:`\alpha`  determinants. 

    /!\ : The buffer is transposed ! 







.. c:function:: get_all_spin_singles_and_doubles_2

    .. code:: text

        subroutine get_all_spin_singles_and_doubles_2(buffer, idx, spindet, size_buffer, singles, doubles, n_singles, n_doubles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the single and double excitations in the list of unique  :math:`lpha`  determinants. 

    /!\ : The buffer is transposed ! 







.. c:function:: get_all_spin_singles_and_doubles_3

    .. code:: text

        subroutine get_all_spin_singles_and_doubles_3(buffer, idx, spindet, size_buffer, singles, doubles, n_singles, n_doubles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the single and double excitations in the list of unique  :math:`lpha`  determinants. 

    /!\ : The buffer is transposed ! 







.. c:function:: get_all_spin_singles_and_doubles_4

    .. code:: text

        subroutine get_all_spin_singles_and_doubles_4(buffer, idx, spindet, size_buffer, singles, doubles, n_singles, n_doubles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the single and double excitations in the list of unique  :math:`lpha`  determinants. 

    /!\ : The buffer is transposed ! 







.. c:function:: get_all_spin_singles_and_doubles_n_int

    .. code:: text

        subroutine get_all_spin_singles_and_doubles_N_int(buffer, idx, spindet, size_buffer, singles, doubles, n_singles, n_doubles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the single and double excitations in the list of unique  :math:`lpha`  determinants. 

    /!\ : The buffer is transposed ! 







.. c:function:: get_all_spin_singles_n_int

    .. code:: text

        subroutine get_all_spin_singles_N_int(buffer, idx, spindet, size_buffer, singles, n_singles)

    File: :file:`spindeterminants.irp.f_template_1223`

    

    Returns the indices of all the single excitations in the list of unique  :math:`lpha`  determinants. 







.. c:function:: get_double_excitation

    .. code:: text

        subroutine get_double_excitation(det1,det2,exc,phase,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the two excitation operators between two doubly excited determinants and the phase.





.. c:function:: get_double_excitation_spin

    .. code:: text

        subroutine get_double_excitation_spin(det1,det2,exc,phase,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the two excitation operators between two doubly excited spin-determinants and the phase.





.. c:function:: get_excitation

    .. code:: text

        subroutine get_excitation(det1,det2,exc,degree,phase,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the excitation operators between two determinants and the phase.





.. c:function:: get_excitation_degree

    .. code:: text

        subroutine get_excitation_degree(key1,key2,degree,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the excitation degree between two determinants.





.. c:function:: get_excitation_degree_spin

    .. code:: text

        subroutine get_excitation_degree_spin(key1,key2,degree,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the excitation degree between two determinants.





.. c:function:: get_excitation_degree_vector

    .. code:: text

        subroutine get_excitation_degree_vector(key1,key2,degree,Nint,sze,idx)

    File: :file:`slater_rules.irp.f`

    Applies get_excitation_degree to an array of determinants.





.. c:function:: get_excitation_degree_vector_double_alpha_beta

    .. code:: text

        subroutine get_excitation_degree_vector_double_alpha_beta(key1,key2,degree,Nint,sze,idx)

    File: :file:`slater_rules.irp.f`

    Applies get_excitation_degree to an array of determinants and return only the single excitations and the connections through exchange integrals.





.. c:function:: get_excitation_degree_vector_mono

    .. code:: text

        subroutine get_excitation_degree_vector_mono(key1,key2,degree,Nint,sze,idx)

    File: :file:`slater_rules.irp.f`

    Applies get_excitation_degree to an array of determinants and returns only the single excitations.





.. c:function:: get_excitation_degree_vector_mono_or_exchange

    .. code:: text

        subroutine get_excitation_degree_vector_mono_or_exchange(key1,key2,degree,Nint,sze,idx)

    File: :file:`slater_rules.irp.f`

    Applies get_excitation_degree to an array of determinants and return only the single excitations and the connections through exchange integrals.





.. c:function:: get_excitation_degree_vector_mono_or_exchange_verbose

    .. code:: text

        subroutine get_excitation_degree_vector_mono_or_exchange_verbose(key1,key2,degree,Nint,sze,idx)

    File: :file:`slater_rules.irp.f`

    Applies get_excitation_degree to an array of determinants and return only the single excitations and the connections through exchange integrals.





.. c:function:: get_excitation_spin

    .. code:: text

        subroutine get_excitation_spin(det1,det2,exc,degree,phase,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the excitation operators between two determinants and the phase.





.. c:function:: get_index_in_psi_det_alpha_unique

    .. code:: text

        integer function get_index_in_psi_det_alpha_unique(key,Nint)

    File: :file:`spindeterminants.irp.f`

    Returns the index of the determinant in the ``psi_det_alpha_unique`` array





.. c:function:: get_index_in_psi_det_beta_unique

    .. code:: text

        integer function get_index_in_psi_det_beta_unique(key,Nint)

    File: :file:`spindeterminants.irp.f`

    Returns the index of the determinant in the ``psi_det_beta_unique`` array





.. c:function:: get_index_in_psi_det_sorted_bit

    .. code:: text

        integer function get_index_in_psi_det_sorted_bit(key,Nint)

    File: :file:`connected_to_ref.irp.f`

    Returns the index of the determinant in the ``psi_det_sorted_bit`` array





.. c:function:: get_mono_excitation

    .. code:: text

        subroutine get_mono_excitation(det1,det2,exc,phase,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the excitation operator between two singly excited determinants and the phase.





.. c:function:: get_mono_excitation_from_fock

    .. code:: text

        subroutine get_mono_excitation_from_fock(det_1,det_2,h,p,spin,phase,hij)

    File: :file:`single_excitations.irp.f`

    





.. c:function:: get_mono_excitation_spin

    .. code:: text

        subroutine get_mono_excitation_spin(det1,det2,exc,phase,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the excitation operator between two singly excited determinants and the phase.





.. c:function:: get_phase

    .. code:: text

        subroutine get_phase(key1,key2,phase,Nint)

    File: :file:`slater_rules.irp.f`

    Returns the phase between key1 and key2.





.. c:function:: get_phasemask_bit

    .. code:: text

        subroutine get_phasemask_bit(det1, pm, Nint)

    File: :file:`slater_rules.irp.f`

    





.. c:function:: get_s2

    .. code:: text

        subroutine get_s2(key_i,key_j,Nint,s2)

    File: :file:`s2.irp.f`

    Returns <S^2>





.. c:function:: get_uj_s2_ui

    .. code:: text

        subroutine get_uJ_s2_uI(psi_keys_tmp,psi_coefs_tmp,n,nmax_coefs,nmax_keys,s2,nstates)

    File: :file:`s2.irp.f`

    returns the matrix elements of S^2 "s2(i,j)" between the "nstates" states psi_coefs_tmp(:,i) and psi_coefs_tmp(:,j)





.. c:function:: getmobiles

    .. code:: text

        subroutine getMobiles(key,key_mask, mobiles,Nint)

    File: :file:`filter_connected.irp.f`

    





.. c:function:: i_h_j

    .. code:: text

        subroutine i_H_j(key_i,key_j,Nint,hij)

    File: :file:`slater_rules.irp.f`

    Returns  :math:`\langle i|H|j \rangle`  where  :math:`i`  and  :math:`j`  are determinants.





.. c:function:: i_h_j_double_alpha_beta

    .. code:: text

        subroutine i_H_j_double_alpha_beta(key_i,key_j,Nint,hij)

    File: :file:`slater_rules.irp.f`

    Returns  :math:`\langle i|H|j \rangle`  where  :math:`i`  and  :math:`j`  are determinants differing by an opposite-spin double excitation.





.. c:function:: i_h_j_double_spin

    .. code:: text

        subroutine i_H_j_double_spin(key_i,key_j,Nint,hij)

    File: :file:`slater_rules.irp.f`

    Returns  :math:`\langle i|H|j \rangle`  where  :math:`i`  and  :math:`j`  are determinants differing by a same-spin double excitation.





.. c:function:: i_h_j_mono_spin

    .. code:: text

        subroutine i_H_j_mono_spin(key_i,key_j,Nint,spin,hij)

    File: :file:`slater_rules.irp.f`

    Returns  :math:`\langle i|H|j \rangle`  where  :math:`i`  and  :math:`j`  are determinants differing by a single excitation.





.. c:function:: i_h_j_mono_spin_one_e

    .. code:: text

        subroutine i_H_j_mono_spin_one_e(key_i,key_j,Nint,spin,hij)

    File: :file:`slater_rules_wee_mono.irp.f`

    Returns  :math:`\langle i|H|j \rangle`   where  :math:`i`  and  :math:`j`  are determinants differing by a single excitation.





.. c:function:: i_h_j_one_e

    .. code:: text

        subroutine i_H_j_one_e(key_i,key_j,Nint,hij)

    File: :file:`slater_rules_wee_mono.irp.f`

    Returns  :math:`\langle i|H|j \rangle`   where  :math:`i`  and  :math:`j`  are determinants.





.. c:function:: i_h_j_s2

    .. code:: text

        subroutine i_H_j_s2(key_i,key_j,Nint,hij,s2)

    File: :file:`slater_rules.irp.f`

    Returns  :math:`\langle i|H|j \rangle`  and  :math:`\langle i|S^2|j \rangle` where  :math:`i`  and  :math:`j`  are determinants.





.. c:function:: i_h_j_two_e

    .. code:: text

        subroutine i_H_j_two_e(key_i,key_j,Nint,hij)

    File: :file:`slater_rules_wee_mono.irp.f`

    Returns  :math:`\langle i|H|j \rangle`   where  :math:`i`  and  :math:`j`  are determinants.





.. c:function:: i_h_j_verbose

    .. code:: text

        subroutine i_H_j_verbose(key_i,key_j,Nint,hij,hmono,hdouble,phase)

    File: :file:`slater_rules.irp.f`

    Returns  :math:`\langle i|H|j \rangle`  where  :math:`i`  and  :math:`j`  are determinants.





.. c:function:: i_h_psi

    .. code:: text

        subroutine i_H_psi(key,keys,coef,Nint,Ndet,Ndet_max,Nstate,i_H_psi_array)

    File: :file:`slater_rules.irp.f`

    Computes  :math:`\langle i|H|Psi \rangle  = \sum_J c_J \langle i | H | J \rangle` . 

    Uses filter_connected_i_H_psi0 to get all the  :math:`|J \rangle`  to which  :math:`|i \rangle` is connected. The i_H_psi_minilist is much faster but requires to build the minilists.





.. c:function:: i_h_psi_minilist

    .. code:: text

        subroutine i_H_psi_minilist(key,keys,idx_key,N_minilist,coef,Nint,Ndet,Ndet_max,Nstate,i_H_psi_array)

    File: :file:`slater_rules.irp.f`

    Computes  :math:`\langle i|H|\Psi \rangle = \sum_J c_J \langle i|H|J\rangle` . 

    Uses filter_connected_i_H_psi0 to get all the  :math:`|J \rangle`  to which  :math:`|i \rangle` is connected. The  :math:`|J\rangle`  are searched in short pre-computed lists.





.. c:function:: i_s2_psi_minilist

    .. code:: text

        subroutine i_S2_psi_minilist(key,keys,idx_key,N_minilist,coef,Nint,Ndet,Ndet_max,Nstate,i_S2_psi_array)

    File: :file:`s2.irp.f`

    Computes  :math:`\langle i|S^2|\Psi \rangle = \sum_J c_J \langle i|S^2|J \rangle` . 

    Uses filter_connected_i_H_psi0 to get all the  :math:`|J\rangle`  to which  :math:`|i\rangle` is connected. The  :math:`|J\rangle`  are searched in short pre-computed lists.





.. c:function:: i_wee_j_mono

    .. code:: text

        subroutine i_Wee_j_mono(key_i,key_j,Nint,spin,hij)

    File: :file:`slater_rules_wee_mono.irp.f`

    Returns  :math:`\langle i|H|j \rangle`   where  :math:`i`  and  :math:`j`  are determinants differing by a single excitation.





.. c:function:: is_connected_to

    .. code:: text

        logical function is_connected_to(key,keys,Nint,Ndet)

    File: :file:`connected_to_ref.irp.f`

    Returns |true| if determinant ``key`` is connected to ``keys``





.. c:function:: is_connected_to_by_mono

    .. code:: text

        logical function is_connected_to_by_mono(key,keys,Nint,Ndet)

    File: :file:`connected_to_ref.irp.f`

    Returns |true| is ``key`` is connected to ``keys`` by a single excitation.





.. c:function:: is_in_wavefunction

    .. code:: text

        logical function is_in_wavefunction(key,Nint)

    File: :file:`connected_to_ref.irp.f`

    |true| if the determinant ``det`` is in the wave function





.. c:function:: is_spin_flip_possible

    .. code:: text

        logical function is_spin_flip_possible(key_in,i_flip,ispin)

    File: :file:`create_excitations.irp.f`

    returns |true| if the spin-flip of spin ispin in the orbital i_flip is possible on key_in





.. c:function:: make_s2_eigenfunction

    .. code:: text

        subroutine make_s2_eigenfunction

    File: :file:`occ_pattern.irp.f`

    





.. c:function:: mono_excitation_wee

    .. code:: text

        subroutine mono_excitation_wee(det_1,det_2,h,p,spin,phase,hij)

    File: :file:`mono_excitations_bielec.irp.f`

    





.. c:function:: occ_pattern_of_det

    .. code:: text

        subroutine occ_pattern_of_det(d,o,Nint)

    File: :file:`occ_pattern.irp.f`

    Transforms a determinant to an occupation pattern 

    occ(:,1) : Single occupations 

    occ(:,2) : Double occupations 







.. c:function:: occ_pattern_search_key

    .. code:: text

        integer*8 function occ_pattern_search_key(det,Nint)

    File: :file:`connected_to_ref.irp.f`

    Return an integer*8 corresponding to a determinant index for searching





.. c:function:: occ_pattern_to_dets

    .. code:: text

        subroutine occ_pattern_to_dets(o,d,sze,n_alpha,Nint)

    File: :file:`occ_pattern.irp.f`

    Generate all possible determinants for a give occ_pattern





.. c:function:: occ_pattern_to_dets_size

    .. code:: text

        subroutine occ_pattern_to_dets_size(o,sze,n_alpha,Nint)

    File: :file:`occ_pattern.irp.f`

    Number of possible determinants for a given occ_pattern





.. c:function:: pull_pt2

    .. code:: text

        subroutine pull_pt2(zmq_socket_pull,pt2,norm_pert,H_pert_diag,i_generator,N_st,n,task_id)

    File: :file:`h_apply.irp.f`

    Pull |PT2| calculation in the collector





.. c:function:: push_pt2

    .. code:: text

        subroutine push_pt2(zmq_socket_push,pt2,norm_pert,H_pert_diag,i_generator,N_st,task_id)

    File: :file:`h_apply.irp.f`

    Push |PT2| calculation to the collector





.. c:function:: read_dets

    .. code:: text

        subroutine read_dets(det,Nint,Ndet)

    File: :file:`determinants.irp.f`

    Reads the determinants from the |EZFIO| file





.. c:function:: remove_duplicates_in_psi_det

    .. code:: text

        subroutine remove_duplicates_in_psi_det(found_duplicates)

    File: :file:`h_apply.irp.f`

    Removes duplicate determinants in the wave function.





.. c:function:: resize_h_apply_buffer

    .. code:: text

        subroutine resize_H_apply_buffer(new_size,iproc)

    File: :file:`h_apply.irp.f`

    Resizes the H_apply buffer of proc iproc. The buffer lock should be set before calling this function.





.. c:function:: routine_example_psi_det

    .. code:: text

        subroutine routine_example_psi_det

    File: :file:`example.irp.f`

    subroutine that illustrates the main features available in determinants using many determinants





.. c:function:: s2_u_0

    .. code:: text

        subroutine S2_u_0(v_0,u_0,n,keys_tmp,Nint)

    File: :file:`s2.irp.f`

    Computes v_0 = S^2|u_0> 

    n : number of determinants 







.. c:function:: s2_u_0_nstates

    .. code:: text

        subroutine S2_u_0_nstates(v_0,u_0,n,keys_tmp,Nint,N_st,sze_8)

    File: :file:`s2.irp.f`

    Computes v_0  = S^2|u_0> 

    n : number of determinants 







.. c:function:: save_natural_mos

    .. code:: text

        subroutine save_natural_mos

    File: :file:`density_matrix.irp.f`

    Save natural orbitals, obtained by diagonalization of the one-body density matrix in the |MO| basis





.. c:function:: save_ref_determinant

    .. code:: text

        subroutine save_ref_determinant

    File: :file:`determinants.irp.f`

    





.. c:function:: save_wavefunction

    .. code:: text

        subroutine save_wavefunction

    File: :file:`determinants.irp.f`

    Save the wave function into the |EZFIO| file





.. c:function:: save_wavefunction_general

    .. code:: text

        subroutine save_wavefunction_general(ndet,nstates,psidet,dim_psicoef,psicoef)

    File: :file:`determinants.irp.f`

    Save the wave function into the |EZFIO| file





.. c:function:: save_wavefunction_specified

    .. code:: text

        subroutine save_wavefunction_specified(ndet,nstates,psidet,psicoef,ndetsave,index_det_save)

    File: :file:`determinants.irp.f`

    Save the wave function into the |EZFIO| file





.. c:function:: save_wavefunction_truncated

    .. code:: text

        subroutine save_wavefunction_truncated(thr)

    File: :file:`determinants.irp.f`

    Save the wave function into the |EZFIO| file





.. c:function:: save_wavefunction_unsorted

    .. code:: text

        subroutine save_wavefunction_unsorted

    File: :file:`determinants.irp.f`

    Save the wave function into the |EZFIO| file





.. c:function:: set_natural_mos

    .. code:: text

        subroutine set_natural_mos

    File: :file:`density_matrix.irp.f`

    Set natural orbitals, obtained by diagonalization of the one-body density matrix in the |MO| basis





.. c:function:: sort_dets_ab

    .. code:: text

        subroutine sort_dets_ab(key, idx, shortcut, N_key, Nint)

    File: :file:`sort_dets_ab.irp.f`

    Deprecated routine





.. c:function:: sort_dets_ab_v

    .. code:: text

        subroutine sort_dets_ab_v(key_in, key_out, idx, shortcut, version, N_key, Nint)

    File: :file:`sort_dets_ab.irp.f`

    Deprecated routine





.. c:function:: sort_dets_ba_v

    .. code:: text

        subroutine sort_dets_ba_v(key_in, key_out, idx, shortcut, version, N_key, Nint)

    File: :file:`sort_dets_ab.irp.f`

    Deprecated routine





.. c:function:: sort_dets_by_det_search_key

    .. code:: text

        subroutine sort_dets_by_det_search_key(Ndet, det_in, coef_in, sze, det_out, coef_out, N_st)

    File: :file:`determinants.irp.f`

    Determinants are sorted according to their :c:func:`det_search_key`. Useful to accelerate the search of a random determinant in the wave function. 

    /!\ The first dimension of coef_out and coef_in need to be psi_det_size 







.. c:function:: spin_det_search_key

    .. code:: text

        integer*8 function spin_det_search_key(det,Nint)

    File: :file:`spindeterminants.irp.f`

    Returns an integer(8) corresponding to a determinant index for searching





.. c:function:: tamiser

    .. code:: text

        subroutine tamiser(key, idx, no, n, Nint, N_key)

    File: :file:`sort_dets_ab.irp.f`

    





.. c:function:: u_0_s2_u_0

    .. code:: text

        subroutine u_0_S2_u_0(e_0,u_0,n,keys_tmp,Nint,N_st,sze_8)

    File: :file:`s2.irp.f`

    Computes e_0 = <u_0|S2|u_0>/<u_0|u_0> 

    n : number of determinants 







.. c:function:: wf_of_psi_bilinear_matrix

    .. code:: text

        subroutine wf_of_psi_bilinear_matrix(truncate)

    File: :file:`spindeterminants.irp.f`

    Generate a wave function containing all possible products of  :math:`\alpha`  and  :math:`\beta`  determinants





.. c:function:: write_spindeterminants

    .. code:: text

        subroutine write_spindeterminants

    File: :file:`spindeterminants.irp.f`

    





.. c:function:: zmq_get_n_det

    .. code:: text

        integer function zmq_get_N_det(zmq_to_qp_run_socket, worker_id)

    File: :file:`zmq.irp.f_template_379`

    Get N_det from the qp_run scheduler





.. c:function:: zmq_get_n_det_alpha_unique

    .. code:: text

        integer function zmq_get_N_det_alpha_unique(zmq_to_qp_run_socket, worker_id)

    File: :file:`zmq.irp.f_template_379`

    Get N_det_alpha_unique from the qp_run scheduler





.. c:function:: zmq_get_n_det_beta_unique

    .. code:: text

        integer function zmq_get_N_det_beta_unique(zmq_to_qp_run_socket, worker_id)

    File: :file:`zmq.irp.f_template_379`

    Get N_det_beta_unique from the qp_run scheduler





.. c:function:: zmq_get_n_states

    .. code:: text

        integer function zmq_get_N_states(zmq_to_qp_run_socket, worker_id)

    File: :file:`zmq.irp.f_template_379`

    Get N_states from the qp_run scheduler





.. c:function:: zmq_get_psi

    .. code:: text

        integer function zmq_get_psi(zmq_to_qp_run_socket, worker_id)

    File: :file:`zmq.irp.f`

    Get the wave function from the qp_run scheduler





.. c:function:: zmq_get_psi_bilinear

    .. code:: text

        integer function zmq_get_psi_bilinear(zmq_to_qp_run_socket, worker_id)

    File: :file:`zmq.irp.f`

    Get the wave function from the qp_run scheduler





.. c:function:: zmq_get_psi_bilinear_matrix_columns

    .. code:: text

        integer*8 function zmq_get_psi_bilinear_matrix_columns(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_500`

    Get psi_bilinear_matrix_columns on the qp_run scheduler





.. c:function:: zmq_get_psi_bilinear_matrix_order

    .. code:: text

        integer*8 function zmq_get_psi_bilinear_matrix_order(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_500`

    Get psi_bilinear_matrix_order on the qp_run scheduler





.. c:function:: zmq_get_psi_bilinear_matrix_rows

    .. code:: text

        integer*8 function zmq_get_psi_bilinear_matrix_rows(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_500`

    Get psi_bilinear_matrix_rows on the qp_run scheduler





.. c:function:: zmq_get_psi_bilinear_matrix_values

    .. code:: text

        integer*8 function zmq_get_psi_bilinear_matrix_values(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_564`

    get psi_bilinear_matrix_values on the qp_run scheduler





.. c:function:: zmq_get_psi_coef

    .. code:: text

        integer*8 function zmq_get_psi_coef(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_564`

    get psi_coef on the qp_run scheduler





.. c:function:: zmq_get_psi_det

    .. code:: text

        integer*8 function zmq_get_psi_det(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_440`

    Get psi_det on the qp_run scheduler





.. c:function:: zmq_get_psi_det_alpha_unique

    .. code:: text

        integer*8 function zmq_get_psi_det_alpha_unique(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_440`

    Get psi_det_alpha_unique on the qp_run scheduler





.. c:function:: zmq_get_psi_det_beta_unique

    .. code:: text

        integer*8 function zmq_get_psi_det_beta_unique(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_440`

    Get psi_det_beta_unique on the qp_run scheduler





.. c:function:: zmq_get_psi_det_size

    .. code:: text

        integer function zmq_get_psi_det_size(zmq_to_qp_run_socket, worker_id)

    File: :file:`zmq.irp.f_template_379`

    Get psi_det_size from the qp_run scheduler





.. c:function:: zmq_get_psi_notouch

    .. code:: text

        integer function zmq_get_psi_notouch(zmq_to_qp_run_socket, worker_id)

    File: :file:`zmq.irp.f`

    Get the wave function from the qp_run scheduler





.. c:function:: zmq_put_n_det

    .. code:: text

        integer function zmq_put_N_det(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_379`

    Put N_det on the qp_run scheduler





.. c:function:: zmq_put_n_det_alpha_unique

    .. code:: text

        integer function zmq_put_N_det_alpha_unique(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_379`

    Put N_det_alpha_unique on the qp_run scheduler





.. c:function:: zmq_put_n_det_beta_unique

    .. code:: text

        integer function zmq_put_N_det_beta_unique(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_379`

    Put N_det_beta_unique on the qp_run scheduler





.. c:function:: zmq_put_n_states

    .. code:: text

        integer function zmq_put_N_states(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_379`

    Put N_states on the qp_run scheduler





.. c:function:: zmq_put_psi

    .. code:: text

        integer function zmq_put_psi(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f`

    Put the wave function on the qp_run scheduler





.. c:function:: zmq_put_psi_bilinear

    .. code:: text

        integer function zmq_put_psi_bilinear(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f`

    Put the wave function on the qp_run scheduler





.. c:function:: zmq_put_psi_bilinear_matrix_columns

    .. code:: text

        integer*8 function zmq_put_psi_bilinear_matrix_columns(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_500`

    Put psi_bilinear_matrix_columns on the qp_run scheduler





.. c:function:: zmq_put_psi_bilinear_matrix_order

    .. code:: text

        integer*8 function zmq_put_psi_bilinear_matrix_order(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_500`

    Put psi_bilinear_matrix_order on the qp_run scheduler





.. c:function:: zmq_put_psi_bilinear_matrix_rows

    .. code:: text

        integer*8 function zmq_put_psi_bilinear_matrix_rows(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_500`

    Put psi_bilinear_matrix_rows on the qp_run scheduler





.. c:function:: zmq_put_psi_bilinear_matrix_values

    .. code:: text

        integer*8 function zmq_put_psi_bilinear_matrix_values(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_564`

    Put psi_bilinear_matrix_values on the qp_run scheduler





.. c:function:: zmq_put_psi_coef

    .. code:: text

        integer*8 function zmq_put_psi_coef(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_564`

    Put psi_coef on the qp_run scheduler





.. c:function:: zmq_put_psi_det

    .. code:: text

        integer*8 function zmq_put_psi_det(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_440`

    Put psi_det on the qp_run scheduler





.. c:function:: zmq_put_psi_det_alpha_unique

    .. code:: text

        integer*8 function zmq_put_psi_det_alpha_unique(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_440`

    Put psi_det_alpha_unique on the qp_run scheduler





.. c:function:: zmq_put_psi_det_beta_unique

    .. code:: text

        integer*8 function zmq_put_psi_det_beta_unique(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_440`

    Put psi_det_beta_unique on the qp_run scheduler





.. c:function:: zmq_put_psi_det_size

    .. code:: text

        integer function zmq_put_psi_det_size(zmq_to_qp_run_socket,worker_id)

    File: :file:`zmq.irp.f_template_379`

    Put psi_det_size on the qp_run scheduler


