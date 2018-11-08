.. _qp_set_mo_class:

qp_set_mo_class
===============

.. TODO

Usage ::

  qp_set_mo_class [FLAGS] EZFIO_DIRECTORY


Flags ::

  [-act range]    Range of active orbitals
  [-core range]   Range of core orbitals
  [-del range]    Range of deleted orbitals
  [-inact range]  Range of inactive orbitals
  [-q]            Query: print the current masks
  [-virt range]   Range of virtual orbitals
  [-help]         print this help text and exit
                  (alias: -?)

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
   To quickly setup a frozen core calculation, the script ``qp_set_frozen_core.py``
   can be used::

      qp_set_frozen_core.py EZFIO_DIRECTORY

   .. warning::
      For elements on the right of the periodic table, `qp_set_frozen_core.py` will
      work as expected. But for elements on the left, a small core will be chosen. For
      example, a Carbon atom will have 2 core electrons, but a Lithium atom will have
      zero.




