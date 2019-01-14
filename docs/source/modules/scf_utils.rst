.. _scf_utils:

.. program:: scf_utils

.. default-role:: option

=========
scf_utils
=========



The scf_utils module is an abstract module which contains the basics to perform *Restricted* SCF calculations (the
spatial part of the |MOs| is common for alpha and beta spinorbitals) based on a single-determinant wave function.

This module does not produce any executable *and must not do*, but instead it contains everything one needs to perform an orbital optimization based on an Fock matrix. 
The ``scf_utils`` module is meant to be included in the :file:`NEED` of the various single determinant SCF procedures, such as ``hartree_fock`` or ``kohn_sham``, where a specific definition of the Fock matrix is given (see :file:`hartree_fock fock_matrix_hf.irp.f` for an example). 

All SCF programs perform the following actions:


#. Compute/Read all the one- and two-electron integrals, and store them in memory

#. Check in the |EZFIO| database if there is a set of |MOs|. If there is, it
   will read them as initial guess. Otherwise, it will create a guess.
#. Perform the |SCF| iterations based on the definition of the Fock matrix 


The main keywords/options are: 

* :option:`scf_utils thresh_scf` 
* :option:`scf_utils level_shift` 

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

.. option:: max_dim_diis

    Maximum size of the DIIS extrapolation procedure

    Default: 15

.. option:: threshold_diis

    Threshold on the convergence of the DIIS error vector during a Hartree-Fock calculation. If 0. is chosen, the square root of thresh_scf will be used.

    Default: 0.

.. option:: thresh_scf

    Threshold on the convergence of the Hartree Fock energy.

    Default: 1.e-10

.. option:: n_it_scf_max

    Maximum number of SCF iterations

    Default: 500

.. option:: level_shift

    Energy shift on the virtual MOs to improve SCF convergence

    Default: 0.

.. option:: scf_algorithm

    Type of SCF algorithm used. Possible choices are [ Simple | DIIS]

    Default: DIIS

.. option:: mo_guess_type

    Initial MO guess. Can be [ Huckel | HCore ]

    Default: Huckel

.. option:: energy

    Calculated HF energy


.. option:: frozen_orb_scf

    If true, leave untouched all the orbitals defined as core and optimize all the orbitals defined as active with qp_set_mo_class

    Default: False


Providers
---------


.. c:var:: eigenvalues_fock_matrix_ao

    .. code:: text

        double precision, allocatable	:: eigenvalues_fock_matrix_ao	(AO_num)
        double precision, allocatable	:: eigenvectors_fock_matrix_ao	(AO_num,AO_num)

    File: :file:`diis.irp.f`

    Eigenvalues and eigenvectors of the Fock matrix over the AO basis




.. c:var:: eigenvectors_fock_matrix_ao

    .. code:: text

        double precision, allocatable	:: eigenvalues_fock_matrix_ao	(AO_num)
        double precision, allocatable	:: eigenvectors_fock_matrix_ao	(AO_num,AO_num)

    File: :file:`diis.irp.f`

    Eigenvalues and eigenvectors of the Fock matrix over the AO basis




.. c:var:: eigenvectors_fock_matrix_mo

    .. code:: text

        double precision, allocatable	:: eigenvectors_fock_matrix_mo	(ao_num,mo_num)

    File: :file:`diagonalize_fock.irp.f`

    Eigenvector of the Fock matrix in the MO basis obtained with level shift.




.. c:var:: extrapolate_fock_matrix

    .. code:: text

        subroutine extrapolate_Fock_matrix(      &
          error_matrix_DIIS,Fock_matrix_DIIS,    &
          Fock_matrix_AO_,size_Fock_matrix_AO,   &
          iteration_SCF,dim_DIIS                 &
        )

    File: :file:`roothaan_hall_scf.irp.f`

    Compute the extrapolated Fock matrix using the DIIS procedure




.. c:var:: fock_matrix_ao

    .. code:: text

        double precision, allocatable	:: fock_matrix_ao	(ao_num,ao_num)

    File: :file:`fock_matrix.irp.f`

    Fock matrix in AO basis set




.. c:var:: fock_matrix_diag_mo

    .. code:: text

        double precision, allocatable	:: fock_matrix_mo	(mo_num,mo_num)
        double precision, allocatable	:: fock_matrix_diag_mo	(mo_num)

    File: :file:`fock_matrix.irp.f`

    Fock matrix on the MO basis. For open shells, the ROHF Fock Matrix is :: 

    |   F-K    |  F + K/2  |    F     | |---------------------------------| | F + K/2  |     F     |  F - K/2 | |---------------------------------| |    F     |  F - K/2  |  F + K   | 

    

    F = 1/2 (Fa + Fb) 

    K = Fb - Fa 






.. c:var:: fock_matrix_mo

    .. code:: text

        double precision, allocatable	:: fock_matrix_mo	(mo_num,mo_num)
        double precision, allocatable	:: fock_matrix_diag_mo	(mo_num)

    File: :file:`fock_matrix.irp.f`

    Fock matrix on the MO basis. For open shells, the ROHF Fock Matrix is :: 

    |   F-K    |  F + K/2  |    F     | |---------------------------------| | F + K/2  |     F     |  F - K/2 | |---------------------------------| |    F     |  F - K/2  |  F + K   | 

    

    F = 1/2 (Fa + Fb) 

    K = Fb - Fa 






.. c:var:: fock_matrix_mo_alpha

    .. code:: text

        double precision, allocatable	:: fock_matrix_mo_alpha	(mo_num,mo_num)

    File: :file:`fock_matrix.irp.f`

    Fock matrix on the MO basis




.. c:var:: fock_matrix_mo_beta

    .. code:: text

        double precision, allocatable	:: fock_matrix_mo_beta	(mo_num,mo_num)

    File: :file:`fock_matrix.irp.f`

    Fock matrix on the MO basis




.. c:var:: fps_spf_matrix_ao

    .. code:: text

        double precision, allocatable	:: fps_spf_matrix_ao	(AO_num,AO_num)

    File: :file:`diis.irp.f`

    Commutator FPS - SPF




.. c:var:: fps_spf_matrix_mo

    .. code:: text

        double precision, allocatable	:: fps_spf_matrix_mo	(mo_num,mo_num)

    File: :file:`diis.irp.f`

    Commutator FPS - SPF in MO basis




.. c:var:: scf_density_matrix_ao

    .. code:: text

        double precision, allocatable	:: scf_density_matrix_ao	(ao_num,ao_num)

    File: :file:`scf_density_matrix_ao.irp.f`

    S^{-1}.P.S^{-1}  where P = C.C^t




.. c:var:: scf_density_matrix_ao_alpha

    .. code:: text

        double precision, allocatable	:: scf_density_matrix_ao_alpha	(ao_num,ao_num)

    File: :file:`scf_density_matrix_ao.irp.f`

    S^{-1}.P_alpha.S^{-1}




.. c:var:: scf_density_matrix_ao_beta

    .. code:: text

        double precision, allocatable	:: scf_density_matrix_ao_beta	(ao_num,ao_num)

    File: :file:`scf_density_matrix_ao.irp.f`

    S^{-1}.P_beta.S^{-1}




.. c:var:: scf_energy

    .. code:: text

        double precision	:: scf_energy

    File: :file:`fock_matrix.irp.f`

    Hartree-Fock energy




.. c:var:: threshold_diis_nonzero

    .. code:: text

        double precision	:: threshold_diis_nonzero

    File: :file:`diis.irp.f`

    If threshold_DIIS is zero, choose sqrt(thresh_scf)




Subroutines / functions
-----------------------



.. c:function:: damping_scf

    .. code:: text

        subroutine damping_SCF

    File: :file:`damping_scf.irp.f`

    





.. c:function:: huckel_guess

    .. code:: text

        subroutine huckel_guess

    File: :file:`huckel.irp.f`

    Build the MOs using the extended Huckel model





.. c:function:: roothaan_hall_scf

    .. code:: text

        subroutine Roothaan_Hall_SCF

    File: :file:`roothaan_hall_scf.irp.f`

    Roothaan-Hall algorithm for SCF Hartree-Fock calculation


