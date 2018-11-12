.. _integrals_bielec:

.. program:: integrals_bielec

.. default-role:: option

================
Integrals_Bielec
================

Here, all two-electron integrals (:math:`1/r_{12}`) are computed.
As they have 4 indices and many are zero, they are stored in a map, as defined
in :file:`Utils/map_module.f90`.

To fetch an |AO| integral, use the
`get_ao_bielec_integral(i,j,k,l,ao_integrals_map)` function, and
to fetch an |MO| integral, use
`get_mo_bielec_integral(i,j,k,l,mo_integrals_map)` or
`mo_bielec_integral(i,j,k,l)`.

The conventions are:

* For |AO| integrals : (ik|jl) = (11|22)
* For |MO| integrals : <ij|kl> = <12|12>






EZFIO parameters
----------------

.. option:: disk_access_mo_integrals

   Read/Write |MO| integrals from/to disk [ Write | Read | None ]

   Default: None

.. option:: disk_access_ao_integrals

   Read/Write |AO| integrals from/to disk [ Write | Read | None ]

   Default: None

.. option:: ao_integrals_threshold

   If | (pq|rs) | < `ao_integrals_threshold` then (pq|rs) is zero

   Default: 1.e-15

.. option:: mo_integrals_threshold

   If | <ij|kl> | < `mo_integrals_threshold` then <ij|kl> is zero

   Default: 1.e-15

.. option:: no_vvvv_integrals

   If `True`, computes all integrals except for the integrals having 4 virtual indices

   Default: False

.. option:: no_ivvv_integrals

   Can be switched on only if `no_vvvv_integrals` is `True`, then does not compute the integrals with 3 virtual indices and 1 belonging to the core inactive active orbitals

   Default: False

.. option:: no_vvv_integrals

   Can be switched on only if `no_vvvv_integrals` is `True`, then does not compute the integrals with 3 virtual orbitals

   Default: False

.. option:: do_direct_integrals

   Compute integrals on the fly (very slow, only for debugging)

   Default: False
