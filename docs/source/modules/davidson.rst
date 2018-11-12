.. _davidson:

.. program:: davidson

.. default-role:: option

==============
Davidson_Utils
==============

Abstract module for Davidson's diagonalization.
It contains everything required for the Davidson algorithm, dressed or not. If
a dressing is used, the dressing column should be defined and the
:ref:`davidsondressed` module should be used. If no dressing is required,
the :ref:`davidson` module should be used, and it has a default zero dressing vector.





EZFIO parameters
----------------

.. option:: threshold_davidson

   Thresholds of Davidson's algorithm

   Default: 1.e-12

.. option:: n_states_diag

   Number of states to consider during the Davdison diagonalization

   Default: 4

.. option:: davidson_sze_max

   Number of micro-iterations before re-contracting

   Default: 8

.. option:: state_following

   If true, the states are re-ordered to match the input states

   Default: False

.. option:: disk_based_davidson

   If true, disk space is used to store the vectors

   Default: False

.. option:: distributed_davidson

   If true, use the distributed algorithm

   Default: False
