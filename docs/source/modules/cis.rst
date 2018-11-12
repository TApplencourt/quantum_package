.. _cis:

.. program:: cis

.. default-role:: option

===
CIS
===

This module contains a CIS program, built by setting the following rules:

* The only generator determinant is the Hartree-Fock (single-reference method)
* All generated singly excited determinants are included in the wave function (no perturbative
  selection)

These rules are set in the ``H_apply.irp.f`` file.





EZFIO parameters
----------------

.. option:: energy

   Variational CIS energy

