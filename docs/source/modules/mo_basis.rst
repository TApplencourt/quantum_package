.. _mo_basis:

.. program:: mo_basis

.. default-role:: option

========
MO_Basis
========

Molecular orbitals are expressed as 

.. math::

  \phi_k({\bf r}) = \sum_i C_{ik} \chi_k({\bf r})


where :math:`\chi_k` are *normalized* atomic basis functions.

The current set of |MOs| has a label `mo_label`.
When the orbitals are modified, the label should also be updated to keep
everything consistent.

When saving the |MOs|, the :file:`mo_basis` directory of the |EZFIO| database
is copied in the :file:`save` directory, named by the current `mo_label`. All
this is done with the script named :file:`save_current_mos.sh` in the
:file:`$QP_ROOT/scripts` directory.






EZFIO parameters
----------------

.. option:: mo_tot_num

   Total number of |MOs|


.. option:: mo_coef

   Coefficient of the i-th |AO| on the j-th |MO|


.. option:: mo_label

   Label characterizing the MOS (Local, Canonical, Natural, *etc*)


.. option:: mo_occ

   |MO| occupation numbers


.. option:: mo_class

   [ Core | Inactive | Active | Virtual | Deleted ], as defined by :ref:`qp_set_mo_class`


.. option:: ao_md5

   MD5 checksum characterizing the |AO| basis set.

