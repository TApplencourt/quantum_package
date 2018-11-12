.. _ao_basis:

.. program:: ao_basis

.. default-role:: option

========
AO_Basis
========

This module describes the atomic orbitals basis set.

An |AO| :math:`\chi` centered on nucleus A is represented as:

.. math::

   \chi_i({\bf r}) = (x-X_A)^a (y-Y_A)^b (z-Z_A)^c \sum_k c_{ki} e^{-\gamma_{ki} |{\bf r} - {\bf R}_A|^2}


The |AO| coefficients are normalized as:

.. math::

  {\tilde c}_{ki} = \frac{c_{ki}}{ \int \left( (x-X_A)^a (y-Y_A)^b (z-Z_A)^c  e^{-\gamma_{ki} |{\bf r} - {\bf R}_A|^2} \right)^2 dr}

Warning: `ao_coef` contains the |AO| coefficients given in input. These do not
include the normalization constant of the |AO|. The `ao_coef_normalized` provider includes
this normalization factor.

The |AOs| are also sorted by increasing exponent to accelerate the calculation of
the two electron integrals.






EZFIO parameters
----------------

.. option:: ao_basis

   Name of the |AO| basis set


.. option:: ao_num

   Number of |AOs|


.. option:: ao_prim_num

   Number of primitives per |AO|


.. option:: ao_prim_num_max

   Maximum number of primitives

   Default: =maxval(ao_basis.ao_prim_num)

.. option:: ao_nucl

   Index of the nucleus on which the |AO| is centered


.. option:: ao_power

   Powers of x, y and z for each |AO|


.. option:: ao_coef

   Primitive coefficients, read from input. Those should not be used directly, as the MOs are expressed on the basis of **normalized** AOs.


.. option:: ao_expo

   Exponents for each primitive of each |AO|


.. option:: ao_md5

   MD5 key, specific of the |AO| basis


.. option:: ao_cartesian

   If true, use |AOs| in Cartesian coordinates (6d,10f,...)

   Default: false
