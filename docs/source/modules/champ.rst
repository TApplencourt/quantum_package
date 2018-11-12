.. _champ:

.. program:: champ

.. default-role:: option

===============
CHAMP Interface
===============

For multi-state calculations, to extract state 2 use:

.. code-block:: bash

   QP_STATE=2 qp_run save_for_champ x.ezfio

(state 1 is the ground state).





EZFIO parameters
----------------

.. option:: ci_threshold

   Threshold on the CI coefficients as in QMCChem

   Default: 1.e-8
