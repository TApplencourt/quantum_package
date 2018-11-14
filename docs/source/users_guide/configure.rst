=========
configure
=========


.. program:: configure

Usage
-----

.. code:: bash

  ./configure [-h | -c <file> | -i <package>] 

.. option:: -c <file>, --config <file>

   Define a configuration file, in :file`${QP_ROOT}/config/`

.. option::  -h, --help

   Print the help message

.. option::  -i <package>, --install <package>

   Try to install <package>. Use at your own risk.

Example
-------

.. code:: bash

     ./configure 
     ./configure -c config/gfortran.cfg

