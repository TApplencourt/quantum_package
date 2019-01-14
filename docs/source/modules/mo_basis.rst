.. _mo_basis:

.. program:: mo_basis

.. default-role:: option

========
mo_basis
========

Molecular orbitals are expressed as 

.. math::

  \phi_k({\bf r}) = \sum_i C_{ik} \chi_k({\bf r})


where :math:`\chi_k` are *normalized* atomic basis functions.

The current set of |MOs| has a label `mo_label`.
When the orbitals are modified, the label should also be updated to keep
everything consistent.

When saving the |MOs|, the :file:`mo_basis` directory of the |EZFIO| database
is copied in the :file:`save` directory, named by the current `mo_label`. All
this is done with the script named :file:`save_current_mos.sh` in the
:file:`$QP_ROOT/scripts` directory.






EZFIO parameters
----------------

.. option:: mo_num

    Total number of |MOs|


.. option:: mo_coef

    Coefficient of the i-th |AO| on the j-th |MO|


.. option:: mo_label

    Label characterizing the MOS (Local, Canonical, Natural, *etc*)


.. option:: mo_occ

    |MO| occupation numbers


.. option:: mo_class

    [ Core | Inactive | Active | Virtual | Deleted ], as defined by :ref:`qp_set_mo_class`


.. option:: ao_md5

    MD5 checksum characterizing the |AO| basis set.



Providers
---------


.. c:var:: mo_coef

    .. code:: text

        double precision, allocatable	:: mo_coef	(ao_num,mo_num)

    File: :file:`mos.irp.f`

    Molecular orbital coefficients on |AO| basis set 

    mo_coef(i,j) = coefficient of the i-th |AO| on the jth mo 

    mo_label : Label characterizing the MOS (local, canonical, natural, etc)




.. c:var:: mo_coef_begin_iteration

    .. code:: text

        double precision, allocatable	:: mo_coef_begin_iteration	(ao_num,mo_num)

    File: :file:`track_orb.irp.f`

    Void provider to store the coefficients of the |MO| basis at the beginning of the SCF iteration 

    Usefull to track some orbitals




.. c:var:: mo_coef_in_ao_ortho_basis

    .. code:: text

        double precision, allocatable	:: mo_coef_in_ao_ortho_basis	(ao_num,mo_num)

    File: :file:`mos.irp.f`

    |MO| coefficients in orthogonalized |AO| basis 

     :math:`C^{-1}.C_{mo}`




.. c:var:: mo_coef_transp

    .. code:: text

        double precision, allocatable	:: mo_coef_transp	(mo_num,ao_num)

    File: :file:`mos.irp.f`

    |MO| coefficients on |AO| basis set




.. c:var:: mo_label

    .. code:: text

        character*(64)	:: mo_label

    File: :file:`mos.irp.f`

    |MO| coefficients on |AO| basis set 

    mo_coef(i,j) = coefficient of the i-th |AO| on the j-th |MO| 

    mo_label : Label characterizing the |MOs| (local, canonical, natural, etc)




.. c:var:: mo_num

    .. code:: text

        integer	:: mo_num

    File: :file:`mos.irp.f`

    Number of MOs




.. c:var:: mo_occ

    .. code:: text

        double precision, allocatable	:: mo_occ	(mo_num)

    File: :file:`mos.irp.f`

    |MO| occupation numbers




Subroutines / functions
-----------------------



.. c:function:: ao_ortho_cano_to_ao

    .. code:: text

        subroutine ao_ortho_cano_to_ao(A_ao,LDA_ao,A,LDA)

    File: :file:`mos.irp.f`

    Transform A from the |AO| basis to the orthogonal |AO| basis 

     :math:`C^{-1}.A_{ao}.C^{\dagger-1}`





.. c:function:: ao_to_mo

    .. code:: text

        subroutine ao_to_mo(A_ao,LDA_ao,A_mo,LDA_mo)

    File: :file:`mos.irp.f`

    Transform A from the |AO| basis to the |MO| basis 

     :math:`C^\dagger.A_{ao}.C`





.. c:function:: give_all_mos_and_grad_and_lapl_at_r

    .. code:: text

        subroutine give_all_mos_and_grad_and_lapl_at_r(r,mos_array,mos_grad_array,mos_lapl_array)

    File: :file:`mos_in_r.irp.f`

    





.. c:function:: give_all_mos_and_grad_at_r

    .. code:: text

        subroutine give_all_mos_and_grad_at_r(r,mos_array,mos_grad_array)

    File: :file:`mos_in_r.irp.f`

    





.. c:function:: give_all_mos_at_r

    .. code:: text

        subroutine give_all_mos_at_r(r,mos_array)

    File: :file:`mos_in_r.irp.f`

    





.. c:function:: initialize_mo_coef_begin_iteration

    .. code:: text

        subroutine initialize_mo_coef_begin_iteration

    File: :file:`track_orb.irp.f`

    

    Initialize :c:data:`mo_coef_begin_iteration` to the current :c:data:`mo_coef`





.. c:function:: mix_mo_jk

    .. code:: text

        subroutine mix_mo_jk(j,k)

    File: :file:`mos.irp.f`

    Rotates the j-th |MO| with the k-th |MO| to give two new |MOs| that are 

    *  :math:`+ = \frac{1}{\sqrt{2}} (|j\rangle + |k\rangle)` 

    *  :math:`- = \frac{1}{\sqrt{2}} (|j\rangle - |k\rangle)` 

    by convention, the '+' |MO| is in the lowest  index (min(j,k)) by convention, the '-' |MO| is in the highest index (max(j,k))





.. c:function:: mo_as_eigvectors_of_mo_matrix

    .. code:: text

        subroutine mo_as_eigvectors_of_mo_matrix(matrix,n,m,label,sign,output)

    File: :file:`utils.irp.f`

    





.. c:function:: mo_as_svd_vectors_of_mo_matrix

    .. code:: text

        subroutine mo_as_svd_vectors_of_mo_matrix(matrix,lda,m,n,label)

    File: :file:`utils.irp.f`

    





.. c:function:: mo_as_svd_vectors_of_mo_matrix_eig

    .. code:: text

        subroutine mo_as_svd_vectors_of_mo_matrix_eig(matrix,lda,m,n,eig,label)

    File: :file:`utils.irp.f`

    





.. c:function:: reorder_active_orb

    .. code:: text

        subroutine reorder_active_orb

    File: :file:`track_orb.irp.f`

    routines that takes the current :c:data:`mo_coef` and reorder the active orbitals (see :c:data:`list_act` and :c:data:`n_act_orb`) according to the overlap with :c:data:`mo_coef_begin_iteration`





.. c:function:: reorder_core_orb

    .. code:: text

        subroutine reorder_core_orb

    File: :file:`track_orb.irp.f`

    routines that takes the current :c:data:`mo_coef` and reorder the core orbitals (see :c:data:`list_core` and :c:data:`n_core_orb`) according to the overlap with :c:data:`mo_coef_begin_iteration`





.. c:function:: save_mos

    .. code:: text

        subroutine save_mos

    File: :file:`utils.irp.f`

    





.. c:function:: save_mos_truncated

    .. code:: text

        subroutine save_mos_truncated(n)

    File: :file:`utils.irp.f`

    


