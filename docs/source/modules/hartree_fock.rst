.. _hartree_fock:

.. program:: hartree_fock

.. default-role:: option

============
hartree_fock
============


The Hartree-Fock module performs *Restricted* Hartree-Fock calculations (the
spatial part of the |MOs| is common for alpha and beta spinorbitals).

The Hartree-Fock in an SCF and therefore is based on the ``scf_utils`` structure. 
It performs the following actions:

#. Compute/Read all the one- and two-electron integrals, and store them in memory

#. Check in the |EZFIO| database if there is a set of |MOs|. If there is, it
   will read them as initial guess. Otherwise, it will create a guess.
#. Perform the |SCF| iterations

The definition of the Fock matrix is in :file:`hartree_fock fock_matrix_hf.irp.f` 
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

    Energy HF



Providers
---------


.. c:var:: ao_two_e_integral_alpha

    .. code:: text

        double precision, allocatable	:: ao_two_e_integral_alpha	(ao_num,ao_num)
        double precision, allocatable	:: ao_two_e_integral_beta	(ao_num,ao_num)

    File: :file:`fock_matrix_hf.irp.f`

    Alpha Fock matrix in AO basis set




.. c:var:: ao_two_e_integral_beta

    .. code:: text

        double precision, allocatable	:: ao_two_e_integral_alpha	(ao_num,ao_num)
        double precision, allocatable	:: ao_two_e_integral_beta	(ao_num,ao_num)

    File: :file:`fock_matrix_hf.irp.f`

    Alpha Fock matrix in AO basis set




.. c:var:: extra_e_contrib_density

    .. code:: text

        double precision	:: extra_e_contrib_density

    File: :file:`hf_energy.irp.f`

    Extra contribution to the SCF energy coming from the density. 

    For a Hartree-Fock calculation: extra_e_contrib_density = 0 

    For a Kohn-Sham or Range-separated Kohn-Sham: the exchange/correlation - trace of the V_xc potential




.. c:var:: fock_matrix_ao_alpha

    .. code:: text

        double precision, allocatable	:: fock_matrix_ao_alpha	(ao_num,ao_num)
        double precision, allocatable	:: fock_matrix_ao_beta	(ao_num,ao_num)

    File: :file:`fock_matrix_hf.irp.f`

    Alpha Fock matrix in AO basis set




.. c:var:: fock_matrix_ao_beta

    .. code:: text

        double precision, allocatable	:: fock_matrix_ao_alpha	(ao_num,ao_num)
        double precision, allocatable	:: fock_matrix_ao_beta	(ao_num,ao_num)

    File: :file:`fock_matrix_hf.irp.f`

    Alpha Fock matrix in AO basis set




.. c:var:: hf_energy

    .. code:: text

        double precision	:: hf_energy
        double precision	:: hf_two_electron_energy
        double precision	:: hf_one_electron_energy

    File: :file:`hf_energy.irp.f`

    Hartree-Fock energy containing the nuclear repulsion, and its one- and two-body components.




.. c:var:: hf_one_electron_energy

    .. code:: text

        double precision	:: hf_energy
        double precision	:: hf_two_electron_energy
        double precision	:: hf_one_electron_energy

    File: :file:`hf_energy.irp.f`

    Hartree-Fock energy containing the nuclear repulsion, and its one- and two-body components.




.. c:var:: hf_two_electron_energy

    .. code:: text

        double precision	:: hf_energy
        double precision	:: hf_two_electron_energy
        double precision	:: hf_one_electron_energy

    File: :file:`hf_energy.irp.f`

    Hartree-Fock energy containing the nuclear repulsion, and its one- and two-body components.




Subroutines / functions
-----------------------



.. c:function:: create_guess

    .. code:: text

        subroutine create_guess

    File: :file:`scf.irp.f`

    Create a MO guess if no MOs are present in the EZFIO directory





.. c:function:: run

    .. code:: text

        subroutine run

    File: :file:`scf.irp.f`

    Run SCF calculation





.. c:function:: scf

    .. code:: text

        subroutine scf

    File: :file:`scf.irp.f`

    Produce `Hartree_Fock` |MOs| 

    output: mo_basis.mo_num mo_basis.mo_label mo_basis.ao_md5 mo_basis.mo_coef mo_basis.mo_occ 

    output: hartree_fock.energy 

    optional: mo_basis.mo_coef


