=================
Quick-start guide
=================

This tutorial should talk you through everything you need to get started with
the |qp|. As an example, we will run a CIPSI calculation on the HCN molecule.

.. important::

   Before using the |qp|, it is required to source the file
   :file:`quantum_package.rc` if it has not been done already in the current
   shell.


.. Include demo video here


Create the EZFIO database
=========================

The data relative to calculations are stored in an |EZFIO| database.
|EZFIO| is a hierarchical data format which uses the hierarchy of the file
system to organize the data, as files stored in a directory.
The data in the |EZFIO| directory are stored as plain text files, so it can be
opened with any text editor.
To access the data of the |EZFIO| database, the APIs (Fortran, |Python|,
|OCaml| or Bash) provided by |EZFIO| should be used, or tools using these APIs
such as :ref:`qp_edit` provided with the |qp|.

First, create an `xyz` file containing the coordinates of the molecule.
The file :file:`hcn.xyz` contains::

   3
   HCN molecule
   C    0.0    0.0    0.0
   H    0.0    0.0    1.064
   N    0.0    0.0    -1.156


This xyz file is now used with the :ref:`qp_create_ezfio_from_xyz` command to
create an |EZFIO| database with the 6-31G basis set:

.. code:: bash

  qp_create_ezfio_from_xyz -b "6-31G" hcn.xyz -o hcn

The EZFIO database now contains data relative to the nuclear coordinates and the atomic
basis set:

.. code:: bash

  $ ls hcn
  ao_basis/  electrons/  ezfio/  nuclei/  pseudo/


Run a Hartree-Fock calculation
------------------------------

The program :ref:`qp_run` is the driver program of the |qp|. To run an SCF calculation,
just run 

.. code:: bash

    qp_run SCF hcn 

The expected energy is ``-92.8278566979`` au.

.. seealso:: 

    The documentation of the :ref:`Hartree_Fock` module.





.. important:: TODO

  .. include:: /work.rst

  * qp_run
  * qp_convert
  * Interfaces : molden/fcidump
  * Natural orbitals
  * Parameters for Hartree-Fock
  * Parameters for Davidson
  * Running in parallel
  * Parameters for selection (Generators/selectors)

