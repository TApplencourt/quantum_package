.. _qp_run:

qp_run
======

.. TODO

.. program:: qp_run

Command used to run a calculation.

Usage
-----

.. code-block:: bash

   qp_run [-slave] <PROGRAM> <EZFIO_DIRECTORY>


.. option:: -slave

   This option needs to be set when ``PROGRAM`` is a slave program, to accelerate
   another running instance of the |qp|.


Example
-------

.. code-block:: bash

   qp_run FCI h2o.ezfio


