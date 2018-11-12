.. _qp_convert_output_to_ezfio.py:

qp_convert_output_to_ezfio.py
=============================

.. program:: qp_convert_output_to_ezfio.py

This Python script uses the `resultsFile`_ Python library to gather the
geometry, |AOs| and |MOs| from output files of |GAMESS| or Gaussian, and creates an
|EZFIO| directory with this information. Some constraints are necessary in the
output file : the run needs to be a single point |HF|, |DFT| or |CAS| |SCF|.

Usage 
-----

.. code-block:: bash

    qp_convert_output_to_ezfio.py <FILE.out> [-o <EZFIO_DIRECTORY>]

.. option:: -o <EZFIO_DIRECTORY>

    Renames the |EZFIO| directory. If this option is not present, the default
    name fill be :file:`<FILE.out>.ezfio`

.. note::
   The following keywords are necessary for Gaussian ::

      GFPRINT pop=Full 

Example
-------

.. code-block:: bash

   qp_convert_output_to_ezfio.py h2o.out -o h2o


