.. _electrons:

.. program:: electrons

.. default-role:: option

=========
Electrons
=========

Describes the electrons. For the moment, only the number of alpha and beta electrons
are provided by this module.


Assumptions
===========

* `elec_num` >= 0
* `elec_alpha_num` >= 0
* `elec_beta_num` >= 0
* `elec_alpha_num` >= `elec_beta_num`





EZFIO parameters
----------------

.. option:: elec_alpha_num

   Numbers of electrons alpha ("up")


.. option:: elec_beta_num

   Numbers of electrons beta ("down")


.. option:: elec_num

   Numbers total of electrons (alpha + beta)

   Default: = electrons.elec_alpha_num + electrons.elec_beta_num
