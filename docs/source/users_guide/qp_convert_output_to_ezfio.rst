.. _qp_convert_output_to_ezfio.py:

qp_convert_output_to_ezfio.py
=============================

.. TODO

Usage ::

    qp_convert_output_to_ezfio.py FILE.out [-o EZFIO_DIRECTORY]

This Python script uses the `resultsFile`_ Python library to gather the geometry,
AOs and MOs from output files of |GAMESS| and Gaussian and create an |EZFIO| directory
with this information. Some constraints are necessary in the output file : the run
needs to be a single point HF, DFT or CASSCF.

.. note::
   The following keywords are necessary for Gaussian ::

      GFPRINT pop=Full 

