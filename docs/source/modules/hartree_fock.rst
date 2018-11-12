.. _hartree_fock:

.. program:: hartree_fock

.. default-role:: option

============
Hartree-Fock
============


The Hartree-Fock module performs *Restricted* Hartree-Fock calculations (the
spatial part of the |MOs| is common for alpha and beta spinorbitals).

The Hartree-Fock program does the following:

#. Compute/Read all the one- and two-electron integrals, and store them in memory
#. Check in the |EZFIO| database if there is a set of |MOs|. If there is, it
   will read them as initial guess. Otherwise, it will create a guess.
#. Perform the |SCF| iterations

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

   Maximum size of the |DIIS| extrapolation procedure

   Default: 15

.. option:: threshold_diis

   Threshold on the convergence of the |DIIS| error vector during a Hartree-Fock calculation. If 0. is chosen, the square root of thresh_scf will be used.

   Default: 0.

.. option:: thresh_scf

   Threshold on the convergence of the Hartree Fock energy.

   Default: 1.e-10

.. option:: n_it_scf_max

   Maximum number of |SCF| iterations

   Default: 500

.. option:: level_shift

   Energy shift on the virtual |MOs| to improve |SCF| convergence

   Default: 0.2

.. option:: scf_algorithm

   Type of |SCF| algorithm used. Possible choices are [ Simple | DIIS]

   Default: DIIS

.. option:: mo_guess_type

   Initial MO guess. Can be [ Huckel | HCore ]

   Default: Huckel

.. option:: energy

   Calculated HF energy


.. option:: no_oa_or_av_opt

   If true, skip the (inactive+core) --> (active) and the (active) --> (virtual) orbital rotations within the |SCF| procedure

   Default: False
