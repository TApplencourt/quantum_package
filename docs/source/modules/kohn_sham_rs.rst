.. _kohn_sham_rs:

.. program:: kohn_sham_rs

.. default-role:: option

============
kohn_sham_rs
============


The Range-separated Kohn-Sham module performs *Restricted* Kohn-Sham calculations (the
spatial part of the |MOs| is common for alpha and beta spinorbitals) where the coulomb interaction is partially treated using exact exchange. 
The splitting of the interaction between long- and short-range is determined by the range-separation parameter :option:`ao_two_e_erf_ints mu_erf`. The long-range part of the interaction is explicitly treated with exact exchange, and the short-range part of the interaction is treated with appropriate DFT functionals. 

The Range-separated Kohn-Sham in an SCF and therefore is based on the ``scf_utils`` structure. 
It performs the following actions:

#. Compute/Read all the one- and two-electron integrals, and store them in memory
#. Check in the |EZFIO| database if there is a set of |MOs|. If there is, it
   will read them as initial guess. Otherwise, it will create a guess.
#. Perform the |SCF| iterations

The definition of the Fock matrix is in :file:`kohn_sham_rs fock_matrix_rs_ks.irp.f` 
For the keywords related to the |SCF| procedure, see the ``scf_utils`` directory where you will find all options. 
The main are: 
# :option:`scf_utils thresh_scf` 
# :option:`scf_utils level_shift` 


At each iteration, the |MOs| are saved in the |EZFIO| database. Hence, if the calculation
crashes for any unexpected reason, the calculation can be restarted by running again
the |SCF| with the same |EZFIO| database.

The `DIIS`_ algorithm is implemented, as well as the `level-shifting`_ method.
If the |SCF| does not converge, try again with a higher value of :option:`level_shift`.

To start a calculation from scratch, the simplest way is to remove the
``mo_basis`` directory from the |EZFIO| database, and run the |SCF| again.


.. _DIIS: https://en.wikipedia.org/w/index.php?title=DIIS
.. _level-shifting: https://doi.org/10.1002/qua.560070407






EZFIO parameters
----------------

.. option:: energy

    Energy range separated hybrid



Providers
---------


.. c:var:: ao_potential_alpha_xc

    .. code:: text

        double precision, allocatable	:: ao_potential_alpha_xc	(ao_num,ao_num)
        double precision, allocatable	:: ao_potential_beta_xc	(ao_num,ao_num)

    File: :file:`pot_functionals.irp.f`

    




.. c:var:: ao_potential_beta_xc

    .. code:: text

        double precision, allocatable	:: ao_potential_alpha_xc	(ao_num,ao_num)
        double precision, allocatable	:: ao_potential_beta_xc	(ao_num,ao_num)

    File: :file:`pot_functionals.irp.f`

    




.. c:var:: e_correlation_dft

    .. code:: text

        double precision	:: e_correlation_dft

    File: :file:`pot_functionals.irp.f`

    




.. c:var:: e_exchange_dft

    .. code:: text

        double precision	:: e_exchange_dft

    File: :file:`pot_functionals.irp.f`

    




.. c:var:: fock_matrix_alpha_no_xc_ao

    .. code:: text

        double precision, allocatable	:: fock_matrix_alpha_no_xc_ao	(ao_num,ao_num)
        double precision, allocatable	:: fock_matrix_beta_no_xc_ao	(ao_num,ao_num)

    File: :file:`fock_matrix_rs_ks.irp.f`

    Mono electronic an Coulomb matrix in AO basis set




.. c:var:: fock_matrix_beta_no_xc_ao

    .. code:: text

        double precision, allocatable	:: fock_matrix_alpha_no_xc_ao	(ao_num,ao_num)
        double precision, allocatable	:: fock_matrix_beta_no_xc_ao	(ao_num,ao_num)

    File: :file:`fock_matrix_rs_ks.irp.f`

    Mono electronic an Coulomb matrix in AO basis set




.. c:var:: fock_matrix_energy

    .. code:: text

        double precision	:: rs_ks_energy
        double precision	:: two_e_energy
        double precision	:: one_e_energy
        double precision	:: fock_matrix_energy
        double precision	:: trace_potential_xc

    File: :file:`rs_ks_energy.irp.f`

    Range-separated Kohn-Sham energy containing the nuclear repulsion energy, and the various components of this quantity.




.. c:var:: one_e_energy

    .. code:: text

        double precision	:: rs_ks_energy
        double precision	:: two_e_energy
        double precision	:: one_e_energy
        double precision	:: fock_matrix_energy
        double precision	:: trace_potential_xc

    File: :file:`rs_ks_energy.irp.f`

    Range-separated Kohn-Sham energy containing the nuclear repulsion energy, and the various components of this quantity.




.. c:var:: one_electron_energy

    .. code:: text

        double precision	:: rs_ks_energy
        double precision	:: two_electron_energy
        double precision	:: one_electron_energy
        double precision	:: fock_matrix_energy
        double precision	:: trace_potential_xc

    File: :file:`rs_ks_energy.irp.f`

    Range-separated Kohn-Sham energy containing the nuclear repulsion energy, and the various components of this quantity.




.. c:var:: rs_ks_energy

    .. code:: text

        double precision	:: rs_ks_energy
        double precision	:: two_e_energy
        double precision	:: one_e_energy
        double precision	:: fock_matrix_energy
        double precision	:: trace_potential_xc

    File: :file:`rs_ks_energy.irp.f`

    Range-separated Kohn-Sham energy containing the nuclear repulsion energy, and the various components of this quantity.




.. c:var:: trace_potential_xc

    .. code:: text

        double precision	:: rs_ks_energy
        double precision	:: two_e_energy
        double precision	:: one_e_energy
        double precision	:: fock_matrix_energy
        double precision	:: trace_potential_xc

    File: :file:`rs_ks_energy.irp.f`

    Range-separated Kohn-Sham energy containing the nuclear repulsion energy, and the various components of this quantity.




.. c:var:: two_e_energy

    .. code:: text

        double precision	:: rs_ks_energy
        double precision	:: two_e_energy
        double precision	:: one_e_energy
        double precision	:: fock_matrix_energy
        double precision	:: trace_potential_xc

    File: :file:`rs_ks_energy.irp.f`

    Range-separated Kohn-Sham energy containing the nuclear repulsion energy, and the various components of this quantity.




.. c:var:: two_electron_energy

    .. code:: text

        double precision	:: rs_ks_energy
        double precision	:: two_electron_energy
        double precision	:: one_electron_energy
        double precision	:: fock_matrix_energy
        double precision	:: trace_potential_xc

    File: :file:`rs_ks_energy.irp.f`

    Range-separated Kohn-Sham energy containing the nuclear repulsion energy, and the various components of this quantity.




Subroutines / functions
-----------------------



.. c:function:: check_coherence_functional

    .. code:: text

        subroutine check_coherence_functional

    File: :file:`rs_ks_scf.irp.f`

    





.. c:function:: rs_ks_scf

    .. code:: text

        subroutine rs_ks_scf

    File: :file:`rs_ks_scf.irp.f`

    Produce `Range_separated_Kohn_Sham` MO orbital output: mo_basis.mo_num mo_basis.mo_label mo_basis.ao_md5 mo_basis.mo_coef mo_basis.mo_occ output: kohn_sham.energy optional: mo_basis.mo_coef


