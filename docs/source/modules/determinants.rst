.. _determinants:

.. program:: determinants

.. default-role:: option

============
Determinants
============

Contains everything for the computation of the Hamiltonian in the basis of Slater determinants.



EZFIO parameters
----------------

.. option:: N_det_max

   Maximum number of determinants in the wave function

   Default: 1000000

.. option:: N_det_max_full

   Maximum number of determinants where |H| is fully diagonalized

   Default: 1000

.. option:: N_states

   Number of states to consider

   Default: 1

.. option:: read_wf

   If true, read the wave function from the |EZFIO| file

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

.. option:: threshold_selectors

   Thresholds on selectors (fraction of the square of the norm)

   Default: 0.999

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

.. option:: store_full_H_mat

   If True, the Davidson diagonalization is performed by storing the full |H| matrix up to n_det_max_stored. Be careful, it can cost a lot of memory but can also save a lot of CPU time

   Default: False

.. option:: n_det_max_stored

   Maximum number of determinants for which the full |H| matrix is stored. be careful, the memory requested scales as 10*n_det_max_stored**2. for instance, 90000 determinants represents a matrix of size 60 Gb.

   Default: 90000

.. option:: state_average_weight

   Weight of the states in state-average calculations.

