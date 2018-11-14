Installation
============


System configuration
--------------------

Set up the environment

.. code:: bash

    ./configure CONFIG_FILE

For example 

.. code:: bash

    ./configure config/gfortran.cfg 

This command will download and install all the missing the requirements, if possible.
Installing |OCaml| and the `Core`_ library may take some time (around 10 minutes).
The, it will create the |Ninja| file for compilation.

By default, the |OCaml| compiler and libraries will be installed in
:file:`$HOME/.opam`.  If you want to install it somewhere else, you can change
this by setting the :envvar:`OPAMROOT` environment variable to the location of
your choice *before* running the :program:`configure` script.  For more info
about the |OCaml| installation with |OPAM|, you can visit the |OPAM| website.


Compiling Flags
---------------

``CONFIG_FILE`` is the path to the file which contains all the flags useful for
the compilation : optimization flags, |BLAS| and |LAPACK| libraries, *etc*.
There are two default configuration files in  :file:`$QP_ROOT/config` :
:file:`ifort.cfg` and :file:`gfortran.cfg`. Copy these files to create a new configuration
file adapted to your architecture, and modify it as required. Then, use this
new file with the :program:`configure` script.

.. note::

   The ``popcnt`` instruction accelerates *a lot* the programs, so the
   SSE4.2, AVX or AVX2 instruction sets should be enabled if possible.

If you encounter an error saying that the Fortran compiler can't produce
executables, it means that the program was built using an instruction set
not supported by the current processor. In that case, use the :option:`-xHost` option
of the Intel Fortran compiler, or the :option:`-march=native` option of GNU Fortran.


Set environment variables
-------------------------

A configuration file named :file:`quantum_package.rc` will be created (or overwritten) 
upon completion of the :program:`configure` script. To finish the installation and to
start using the |qp|, source this file in your shell

.. code:: bash

    source quantum_package.rc

.. important::
   The :file:`quantum_package.rc` file should be sourced in the shell before the
   |qp| can be used. You may want to source it in your :file:`$HOME/.bash_profile`.

.. important::

   If you are using an Infiniband network, and assuming ``ib0`` is the name of
   the network interface used for communications on the compute nodes,
   you will need to add to :file:`quantum_package.rc` 

   .. code:: bash

       export QP_NIC=ib0


.. note::
   If you use a C-shell, you will have to translate the :file:`quantum_package.rc` file into
   C-shell syntax and source it in your shell.



Compile the Progams
-------------------

Go into :file:`$QP_ROOT` and run 


.. code:: bash

  ninja

The compilation will take approximately 5 min.




