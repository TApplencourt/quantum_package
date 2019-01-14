.. _qp_run:

qp_run
======

.. TODO

.. program:: qp_run

Command used to run a calculation.

Usage
-----

.. code:: bash

  qp_run [-h|--help] [-p <string>|--prefix=<string>] [-s|--slave] [--]
      PROGRAM EZFIO_DIR

``PROGRAM`` is the name of the |QP| program to be run, and ``EZFIO_DIR`` is
the name of the |EZFIO| directory containing the data.


.. option:: -h, --help

   Displays the list of available |qp| programs. 


.. option:: -p <string>, --prefix=<string>

   Prefix before running the program. This option is used to run programs like
   like gdb or valgrind.


.. option:: -s, --slave

   This option needs to be set to run a slave job for ``PROGRAM``, to accelerate
   another running instance of the |qp|.


Example
-------

.. code:: bash

   qp_run fci h2o.ezfio &
   srun qp_run --slave fci h2o.ezfio
   wait


