.. _qp_set_mo_class:

qp_set_mo_class
===============

.. program:: qp_set_mo_class


This command sets the orbital classes in an |EZFIO| directory.

Core
  MOs which are always doubly occupied

Deleted
  MOs which are never occupied 

Active 
  MOs in which any number of holes/particles can be made

Inactive 
  MOs in which only holes can be made

Virtual  
  MOs in which only particles can be made

To avoid errors, all the MOs should be given a class.
The range of MOs are given like the ranges in |SLURM| commands. For example,
``"[36-53,72-107,126-131]"``.

.. tip::
   To quickly setup a frozen core calculation, the script :ref:`qp_set_frozen_core`
   can be used.



Usage
-----

.. code:: bash

   qp_set_mo_class [FLAGS] <EZFIO_DIRECTORY>
   Flags:
      [-act range]    [-core range]   [-del range]    
      [-inact range]  [-q]            [-virt range]   
      [-help]         


.. option:: -act <range>

   Range of active orbitals

.. option:: -core <range>

   Range of core orbitals

.. option:: -del <range>

   Range of deleted orbitals

.. option:: -inact <range>

   Range of inactive orbitals

.. option:: -q

   Query: print the current masks

.. option:: -virt <range>

   Range of virtual orbitals

.. option:: -help, -?



