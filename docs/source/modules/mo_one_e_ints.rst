.. _mo_one_e_ints:

.. program:: mo_one_e_ints

.. default-role:: option

==================
mo_one_e_integrals
==================

All the one-electron integrals in |MO| basis are defined here.

The most important providers for usual quantum-chemistry calculation are:  

* `mo_kinetic_integrals` which are the kinetic operator integrals on the |AO| basis (see :file:`kin_mo_ints.irp.f`)
* `mo_integrals_n_e` which are the nuclear-elctron operator integrals on the |AO| basis (see :file:`pot_mo_ints.irp.f`)
* `mo_one_e_integrals` which are the the h_core operator integrals on the |AO| basis (see :file:`mo_mono_ints.irp.f`)

Note that you can find other interesting integrals related to the position operator in :file:`spread_dipole_mo.irp.f`. 



EZFIO parameters
----------------

.. option:: mo_integrals_e_n

    Nucleus-electron integrals in |MO| basis set


.. option:: io_mo_integrals_e_n

    Read/Write |MO| electron-nucleus attraction integrals from/to disk [ Write | Read | None ]

    Default: None

.. option:: mo_integrals_kinetic

    Kinetic energy integrals in |MO| basis set


.. option:: io_mo_integrals_kinetic

    Read/Write |MO| one-electron kinetic integrals from/to disk [ Write | Read | None ]

    Default: None

.. option:: mo_integrals_pseudo

    Pseudopotential integrals in |MO| basis set


.. option:: io_mo_integrals_pseudo

    Read/Write |MO| pseudopotential integrals from/to disk [ Write | Read | None ]

    Default: None

.. option:: mo_one_e_integrals

    One-electron integrals in |MO| basis set


.. option:: io_mo_one_e_integrals

    Read/Write |MO| one-electron integrals from/to disk [ Write | Read | None ]

    Default: None


Providers
---------


.. c:var:: mo_dipole_x

    .. code:: text

        double precision, allocatable	:: mo_dipole_x	(mo_num,mo_num)
        double precision, allocatable	:: mo_dipole_y	(mo_num,mo_num)
        double precision, allocatable	:: mo_dipole_z	(mo_num,mo_num)

    File: :file:`spread_dipole_mo.irp.f`

    array of the integrals of MO_i * x MO_j array of the integrals of MO_i * y MO_j array of the integrals of MO_i * z MO_j




.. c:var:: mo_dipole_y

    .. code:: text

        double precision, allocatable	:: mo_dipole_x	(mo_num,mo_num)
        double precision, allocatable	:: mo_dipole_y	(mo_num,mo_num)
        double precision, allocatable	:: mo_dipole_z	(mo_num,mo_num)

    File: :file:`spread_dipole_mo.irp.f`

    array of the integrals of MO_i * x MO_j array of the integrals of MO_i * y MO_j array of the integrals of MO_i * z MO_j




.. c:var:: mo_dipole_z

    .. code:: text

        double precision, allocatable	:: mo_dipole_x	(mo_num,mo_num)
        double precision, allocatable	:: mo_dipole_y	(mo_num,mo_num)
        double precision, allocatable	:: mo_dipole_z	(mo_num,mo_num)

    File: :file:`spread_dipole_mo.irp.f`

    array of the integrals of MO_i * x MO_j array of the integrals of MO_i * y MO_j array of the integrals of MO_i * z MO_j




.. c:var:: mo_integrals_n_e

    .. code:: text

        double precision, allocatable	:: mo_integrals_n_e	(mo_num,mo_num)

    File: :file:`pot_mo_ints.irp.f`

    Nucleus-electron interaction on the |MO| basis




.. c:var:: mo_integrals_n_e_per_atom

    .. code:: text

        double precision, allocatable	:: mo_integrals_n_e_per_atom	(mo_num,mo_num,nucl_num)

    File: :file:`pot_mo_ints.irp.f`

    mo_integrals_n_e_per_atom(i,j,k) =  :math:`\langle \phi_i| -\frac{1}{|r-R_k|} | \phi_j \rangle` . where R_k is the coordinate of the k-th nucleus.




.. c:var:: mo_kinetic_integrals

    .. code:: text

        double precision, allocatable	:: mo_kinetic_integrals	(mo_num,mo_num)

    File: :file:`kin_mo_ints.irp.f`

    Kinetic energy integrals in the MO basis




.. c:var:: mo_one_e_integrals

    .. code:: text

        double precision, allocatable	:: mo_one_e_integrals	(mo_num,mo_num)

    File: :file:`mo_one_e_ints.irp.f`

    array of the mono electronic hamiltonian on the MOs basis : sum of the kinetic and nuclear electronic potential (and pseudo potential if needed)




.. c:var:: mo_overlap

    .. code:: text

        double precision, allocatable	:: mo_overlap	(mo_num,mo_num)

    File: :file:`mo_overlap.irp.f`

    Provider to check that the MOs are indeed orthonormal.




.. c:var:: mo_pseudo_integrals

    .. code:: text

        double precision, allocatable	:: mo_pseudo_integrals	(mo_num,mo_num)

    File: :file:`pot_mo_pseudo_ints.irp.f`

    Pseudopotential integrals in |MO| basis




.. c:var:: mo_spread_x

    .. code:: text

        double precision, allocatable	:: mo_spread_x	(mo_num,mo_num)
        double precision, allocatable	:: mo_spread_y	(mo_num,mo_num)
        double precision, allocatable	:: mo_spread_z	(mo_num,mo_num)

    File: :file:`spread_dipole_mo.irp.f`

    array of the integrals of MO_i * x^2 MO_j array of the integrals of MO_i * y^2 MO_j array of the integrals of MO_i * z^2 MO_j




.. c:var:: mo_spread_y

    .. code:: text

        double precision, allocatable	:: mo_spread_x	(mo_num,mo_num)
        double precision, allocatable	:: mo_spread_y	(mo_num,mo_num)
        double precision, allocatable	:: mo_spread_z	(mo_num,mo_num)

    File: :file:`spread_dipole_mo.irp.f`

    array of the integrals of MO_i * x^2 MO_j array of the integrals of MO_i * y^2 MO_j array of the integrals of MO_i * z^2 MO_j




.. c:var:: mo_spread_z

    .. code:: text

        double precision, allocatable	:: mo_spread_x	(mo_num,mo_num)
        double precision, allocatable	:: mo_spread_y	(mo_num,mo_num)
        double precision, allocatable	:: mo_spread_z	(mo_num,mo_num)

    File: :file:`spread_dipole_mo.irp.f`

    array of the integrals of MO_i * x^2 MO_j array of the integrals of MO_i * y^2 MO_j array of the integrals of MO_i * z^2 MO_j




.. c:var:: s_mo_coef

    .. code:: text

        double precision, allocatable	:: s_mo_coef	(ao_num,mo_num)

    File: :file:`ao_to_mo.irp.f`

    Product S.C where S is the overlap matrix in the AO basis and C the mo_coef matrix.




Subroutines / functions
-----------------------



.. c:function:: mo_to_ao

    .. code:: text

        subroutine mo_to_ao(A_mo,LDA_mo,A_ao,LDA_ao)

    File: :file:`ao_to_mo.irp.f`

    Transform A from the MO basis to the AO basis 

     :math:`(S.C).A_{mo}.(S.C)^\dagger`





.. c:function:: mo_to_ao_no_overlap

    .. code:: text

        subroutine mo_to_ao_no_overlap(A_mo,LDA_mo,A_ao,LDA_ao)

    File: :file:`ao_to_mo.irp.f`

     :math:`C.A_{mo}.C^\dagger`





.. c:function:: orthonormalize_mos

    .. code:: text

        subroutine orthonormalize_mos

    File: :file:`orthonormalize.irp.f`

    


