.. _mrcc:

.. program:: mrcc

.. default-role:: option

====
MRCC
====

Multi-Reference Coupled Cluster module:

#. A simple approach to the state-specific MR-CC using the intermediate Hamiltonian formalism 
   Emmanuel Giner , Grégoire David , Anthony Scemama and Jean Paul Malrieu (2016), in: J. Chem. Phys., 144:6(064101)

#. Alternative definition of excitation amplitudes in multi-reference state-specific coupled cluster 
   Yann Garniron , Emmanuel Giner , Jean Paul Malrieu and Anthony Scemama (2017), in: The Journal of Chemical Physics, 146:15(154107)

Using this module requires to have a selected |CAS-SD| wave function.






EZFIO parameters
----------------

.. option:: lambda_type

   Type of amplitudes used. lambda=0 : defined in [2], lambda=1 : defined in [1]

   Default: 0

.. option:: energy

   |MRCC| energy


.. option:: energy_pt2

   Selected |MRCC| energy, with |PT2| contribution to estimate the complete |MRCC| energy


.. option:: perturbative_triples

   If `True`, compute the perturbative contribution of the Triples

   Default: true
