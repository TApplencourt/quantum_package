============
Installation
============

The |qp| can be downloaded on GitHub as an `archive
<https://github.com/LCPQ/quantum_package/releases/latest>`_ or as a `git
repository <https://github.com/LCPQ/quantum_package>`_.

.. code:: bash

  git clone https://github.com/LCPQ/quantum_package


Before anything, go into your :file:`quantum_package` directory and run

.. code:: bash

   ./configure


This script will create the :file:`quantum_package.rc` bash script, which
sets all the environment variables required for the normal operation of the
*Quantum Package*.

Running this script will also tell you which external dependencies need to be
installed.

Then, source the :file:`quantum_package.rc` file in your current shell before
installing the dependencies.



Requirements
============

- Linux OS
- Fortran compiler : GNU Fortran, Intel Fortran or IBM XL Fortran
- `GNU make`_
- `Autoconf`_
- `Python`_ > 2.6
- |IRPF90| : Fortran code generator
- |EZFIO| : Easy Fortran Input/Output library generator
- |BLAS| and |LAPACK|
- `EMSL_Basis_Set_Exchange_Local`_ : Local copy of the data contained in the
  `EMSL Basis Set Exchange website <https://bse.pnl.gov/bse/portal>`_
- `Zlib`_
- `GNU Patch`_
- |ZeroMQ| : networking library
- |OCaml| compiler with |OPAM| package manager 
- |Ninja| : a parallel build system


When all the dependencies have been installed, go into the config directory,
and copy the configuration file that corresponds to your architecture. Modify
it if needed, and run :command:`configure` with :option:`configure -c`.

.. code:: bash

   cp ./config/gfortran.example config/gfortran.cfg
   ./configure -c config/gfortran.cfg


.. note::

   The ``popcnt`` instruction accelerates *a lot* the programs, so the
   SSE4.2, AVX or AVX2 instruction sets should be enabled in the
   configuration file if possible.


Help for installing external dependencies
=========================================

Before doing anything below, try to install the packages with your package manager
(:command:`apt`, :command:`yum`, etc)


Ninja
-----

*Ninja* is a build system (like GNU make), with a focus on speed.

* Download the latest binary version of Ninja
  here : `<https://github.com/ninja-build/ninja/releases/latest>`_

* Unzip the ninja-linux.zip file, and move the ninja binary into
  the :file:`${QP_ROOT}/bin` directory.



IRPF90
------

*IRPF90* is a Fortran code generator for programming using the Implicit Reference
to Parameters (IRP) method. 

* Download the latest version of IRPF90
  here : `<https://github.com/scemama/irpf90/releases/latest>`_ and move
  the downloaded archive in the :file:`${QP_ROOT}/external` directory

* Extract the archive and go into the :file:`irpf90-*` directory to run
  :command:`make``

* Create scripts to facilitate the access to :command:`irpf90` and
  :command:`irpman` as follows

.. code:: bash

   for i in irpf90 irpman irpf90_indent
   do
   cat << EOF > ${QP_ROOT}/bin/$i
   #!/bin/sh
   exec $PWD/bin/$i \$@
   EOF

   chmod +x ${QP_ROOT}/bin/$i 
   done



ZeroMQ and its Fortran binding
------------------------------

*ZeroMQ* is a high-performance asynchronous messaging library.

* Download the latest stable version of ZeroMQ
  here : `<https://github.com/zeromq/libzmq/releases/latest>`_ and move the
  downloaded archive in the :file:`${QP_ROOT}/external` directory

* Extract the archive, go into the :file:`zeromq-*` directory and run
  the following commands

.. code:: bash

   ./configure --prefix="${QP_ROOT}" --without-libsodium
   make
   make install


* Download the Fortran binding
  here : `<https://github.com/zeromq/f77_zmq/releases/latest>`_ and move
  the downloaded archive in the :file:`${QP_ROOT}/external` directory

* Extract the archive, go into the :file:`f77_zmq-*` directory and run
  the following commands

.. code:: bash

   export ZMQ_H=${QP_ROOT}/include/zmq.h
   make
   cp libf77zmq.a ${QP_ROOT}/lib
   cp libf77zmq.so ${QP_ROOT}/lib


* Copy the :file:`f77_zmq_free.h` file in the ``ZMQ`` module as follows:

.. code:: bash

   cp f77_zmq_free.h ${QP_ROOT}/src/ZMQ/f77_zmq.h



OCaml
-----

*OCaml* is a general purpose programming language with an emphasis on expressiveness and safety.

* Download the installer of the OPAM package manager here :
  `<//raw.githubusercontent.com/ocaml/opam/master/shell/install.sh>`_
  and move it in the :file:`${QP_ROOT}/external` directory

* If you use OCaml only with the |qp|, you can install the OPAM directory 
  containing the compiler and all the installed libraries in the
  :file:`${QP_ROOT}/external` directory as

  .. code:: bash
       
     export OPAMROOT=${QP_ROOT}/external/opam


* Run the installer

  .. code:: bash
       
     echo ${QP_ROOT}/bin
     ${QP_ROOT}/external/opam_installer.sh --no-backup --fresh

  You the :command:`opam` command can be installed in the :file:`${QP_ROOT}/bin`
  directory. To do this, take the output of ``echo ${QP_ROOT}/bin`` and
  use it as an answer to where :command:`opam` should be installed.
  

* Install the OCaml compiler

  .. code:: bash

      opam init --disable-sandboxing --comp=4.07.0
      eval `${QP_ROOT}/bin/opam env`

* Install the required external OCaml libraries

  .. code:: bash

      opam install cryptokit zmq core sexplib ppx_sexp_conv ppx_deriving


EZFIO
-----

*EZFIO* is the Easy Fortran Input/Output library generator.

* Download EZFIO here : `<https://github.com/scemama/EZFIO/releases/latest>`_ and move
  the downloaded archive in the :file:`${QP_ROOT}/external` directory

* Extract the archive, and rename it as :file:`${QP_ROOT}/external/ezfio`


EMSL Basis Sets
---------------

*EMSL_Basis_Set_Exchange_Local* is a tool which provides all basis sets of the
`EMSL web site <https://bse.pnl.gov/bse/portal>`_ off-line.

* Download the archive
  here : `<https://github.com/LCPQ/EMSL_Basis_Set_Exchange_Local/releases/latest>`_
  and move the downloaded archive in the :file:`${QP_ROOT}/external` directory

* Extract the archive, and rename it as :file:`${QP_ROOT}/external/emsl`.


Docopt
------

*Docopt* is a Python package defining a command-line interface description language.

If you have *pip*, you can do 

.. code:: bash

   pip2 install docopt

Otherwise,

* Download the archive here : `<https://github.com/docopt/docopt/releases/tag/0.6.2>`_

* Extract the archive

* Copy :file:`docopt-0.6.2/docopt.py` in the :file:`${QP_ROOT}/scripts` directory


