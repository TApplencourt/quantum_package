.. _dft_utils_in_r:

.. program:: dft_utils_in_r

.. default-role:: option

==============
dft_utils_in_r
==============

This module contains most of the fundamental quantities (AOs, MOs or density derivatives) evaluated in real-space representation that are needed for the various DFT modules. 

As these quantities might be used and re-used, the values at each point of the grid are stored (see ``becke_numerical_grid`` for more information on the grid).  

The main providers for this module are:

* `aos_in_r_array`: values of the |AO| basis on the grid point.
* `mos_in_r_array`: values of the |MO| basis on the grid point.
* `one_e_dm_and_grad_alpha_in_r`: values of the density and its gradienst on the grid points.




Providers
---------


.. c:var:: aos_grad_in_r_array

    .. code:: text

        double precision, allocatable	:: aos_grad_in_r_array	(ao_num,n_points_final_grid,3)
        double precision, allocatable	:: aos_grad_in_r_array_transp	(n_points_final_grid,ao_num,3)
        double precision, allocatable	:: aos_grad_in_r_array_transp_xyz	(3,n_points_final_grid,ao_num)

    File: :file:`ao_in_r.irp.f`

    aos_grad_in_r_array(i,j,k)          = value of the kth component of the gradient of ith ao on the jth grid point 

    aos_grad_in_r_array_transp(i,j,k)   = value of the kth component of the gradient of jth ao on the ith grid point 

    k = 1 : x, k= 2, y, k  3, z




.. c:var:: aos_grad_in_r_array_transp

    .. code:: text

        double precision, allocatable	:: aos_grad_in_r_array	(ao_num,n_points_final_grid,3)
        double precision, allocatable	:: aos_grad_in_r_array_transp	(n_points_final_grid,ao_num,3)
        double precision, allocatable	:: aos_grad_in_r_array_transp_xyz	(3,n_points_final_grid,ao_num)

    File: :file:`ao_in_r.irp.f`

    aos_grad_in_r_array(i,j,k)          = value of the kth component of the gradient of ith ao on the jth grid point 

    aos_grad_in_r_array_transp(i,j,k)   = value of the kth component of the gradient of jth ao on the ith grid point 

    k = 1 : x, k= 2, y, k  3, z




.. c:var:: aos_grad_in_r_array_transp_xyz

    .. code:: text

        double precision, allocatable	:: aos_grad_in_r_array	(ao_num,n_points_final_grid,3)
        double precision, allocatable	:: aos_grad_in_r_array_transp	(n_points_final_grid,ao_num,3)
        double precision, allocatable	:: aos_grad_in_r_array_transp_xyz	(3,n_points_final_grid,ao_num)

    File: :file:`ao_in_r.irp.f`

    aos_grad_in_r_array(i,j,k)          = value of the kth component of the gradient of ith ao on the jth grid point 

    aos_grad_in_r_array_transp(i,j,k)   = value of the kth component of the gradient of jth ao on the ith grid point 

    k = 1 : x, k= 2, y, k  3, z




.. c:var:: aos_in_r_array

    .. code:: text

        double precision, allocatable	:: aos_in_r_array	(ao_num,n_points_final_grid)
        double precision, allocatable	:: aos_in_r_array_transp	(n_points_final_grid,ao_num)

    File: :file:`ao_in_r.irp.f`

    aos_in_r_array(i,j)        = value of the ith ao on the jth grid point 

    aos_in_r_array_transp(i,j) = value of the jth ao on the ith grid point




.. c:var:: aos_in_r_array_transp

    .. code:: text

        double precision, allocatable	:: aos_in_r_array	(ao_num,n_points_final_grid)
        double precision, allocatable	:: aos_in_r_array_transp	(n_points_final_grid,ao_num)

    File: :file:`ao_in_r.irp.f`

    aos_in_r_array(i,j)        = value of the ith ao on the jth grid point 

    aos_in_r_array_transp(i,j) = value of the jth ao on the ith grid point




.. c:var:: aos_lapl_in_r_array

    .. code:: text

        double precision, allocatable	:: aos_lapl_in_r_array	(ao_num,n_points_final_grid,3)
        double precision, allocatable	:: aos_lapl_in_r_array_transp	(n_points_final_grid,ao_num,3)

    File: :file:`ao_in_r.irp.f`

    aos_lapl_in_r_array(i,j,k)          = value of the kth component of the laplacian of ith ao on the jth grid point 

    aos_lapl_in_r_array_transp(i,j,k)   = value of the kth component of the laplacian of jth ao on the ith grid point 

    k = 1 : x, k= 2, y, k  3, z




.. c:var:: aos_lapl_in_r_array_transp

    .. code:: text

        double precision, allocatable	:: aos_lapl_in_r_array	(ao_num,n_points_final_grid,3)
        double precision, allocatable	:: aos_lapl_in_r_array_transp	(n_points_final_grid,ao_num,3)

    File: :file:`ao_in_r.irp.f`

    aos_lapl_in_r_array(i,j,k)          = value of the kth component of the laplacian of ith ao on the jth grid point 

    aos_lapl_in_r_array_transp(i,j,k)   = value of the kth component of the laplacian of jth ao on the ith grid point 

    k = 1 : x, k= 2, y, k  3, z




.. c:var:: mos_grad_in_r_array

    .. code:: text

        double precision, allocatable	:: mos_grad_in_r_array	(mo_num,n_points_final_grid,3)

    File: :file:`mo_in_r.irp.f`

    mos_grad_in_r_array(i,j,k)          = value of the kth component of the gradient of ith mo on the jth grid point 

    mos_grad_in_r_array_transp(i,j,k)   = value of the kth component of the gradient of jth mo on the ith grid point 

    k = 1 : x, k= 2, y, k  3, z




.. c:var:: mos_in_r_array

    .. code:: text

        double precision, allocatable	:: mos_in_r_array	(mo_num,n_points_final_grid)
        double precision, allocatable	:: mos_in_r_array_transp	(n_points_final_grid,mo_num)

    File: :file:`mo_in_r.irp.f`

    mos_in_r_array(i,j)        = value of the ith mo on the jth grid point 

    mos_in_r_array_transp(i,j) = value of the jth mo on the ith grid point




.. c:var:: mos_in_r_array_transp

    .. code:: text

        double precision, allocatable	:: mos_in_r_array	(mo_num,n_points_final_grid)
        double precision, allocatable	:: mos_in_r_array_transp	(n_points_final_grid,mo_num)

    File: :file:`mo_in_r.irp.f`

    mos_in_r_array(i,j)        = value of the ith mo on the jth grid point 

    mos_in_r_array_transp(i,j) = value of the jth mo on the ith grid point




.. c:var:: mos_lapl_in_r_array

    .. code:: text

        double precision, allocatable	:: mos_lapl_in_r_array	(mo_num,n_points_final_grid,3)

    File: :file:`mo_in_r.irp.f`

    mos_lapl_in_r_array(i,j,k)          = value of the kth component of the laplacian of ith mo on the jth grid point 

    mos_lapl_in_r_array_transp(i,j,k)   = value of the kth component of the laplacian of jth mo on the ith grid point 

    k = 1 : x, k= 2, y, k  3, z




.. c:var:: one_body_dm_alpha_at_r

    .. code:: text

        double precision, allocatable	:: one_body_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_body_dm_alpha_at_r(i,istate) = n_alpha(r_i,istate) one_body_dm_beta_at_r(i,istate) =  n_beta(r_i,istate) where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_body_dm_beta_at_r

    .. code:: text

        double precision, allocatable	:: one_body_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_body_dm_alpha_at_r(i,istate) = n_alpha(r_i,istate) one_body_dm_beta_at_r(i,istate) =  n_beta(r_i,istate) where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_body_grad_2_dm_alpha_at_r

    .. code:: text

        double precision, allocatable	:: one_dm_and_grad_alpha_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_dm_and_grad_beta_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_grad_2_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_grad_2_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_dm_and_grad_alpha_in_r(1,i,i_state) = d\dx n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(2,i,i_state) = d\dy n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(3,i,i_state) = d\dz n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(4,i,i_state) = n_alpha(r_i,istate) one_body_grad_2_dm_alpha_at_r(i,istate)      = d\dx n_alpha(r_i,istate)^2 + d\dy n_alpha(r_i,istate)^2 + d\dz n_alpha(r_i,istate)^2 where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_body_grad_2_dm_beta_at_r

    .. code:: text

        double precision, allocatable	:: one_dm_and_grad_alpha_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_dm_and_grad_beta_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_grad_2_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_grad_2_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_dm_and_grad_alpha_in_r(1,i,i_state) = d\dx n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(2,i,i_state) = d\dy n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(3,i,i_state) = d\dz n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(4,i,i_state) = n_alpha(r_i,istate) one_body_grad_2_dm_alpha_at_r(i,istate)      = d\dx n_alpha(r_i,istate)^2 + d\dy n_alpha(r_i,istate)^2 + d\dz n_alpha(r_i,istate)^2 where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_dm_alpha_in_r

    .. code:: text

        double precision, allocatable	:: one_dm_alpha_in_r	(n_points_integration_angular,n_points_radial_grid,nucl_num,N_states)
        double precision, allocatable	:: one_dm_beta_in_r	(n_points_integration_angular,n_points_radial_grid,nucl_num,N_states)

    File: :file:`dm_in_r.irp.f`

    




.. c:var:: one_dm_and_grad_alpha_in_r

    .. code:: text

        double precision, allocatable	:: one_dm_and_grad_alpha_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_dm_and_grad_beta_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_grad_2_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_grad_2_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_dm_and_grad_alpha_in_r(1,i,i_state) = d\dx n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(2,i,i_state) = d\dy n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(3,i,i_state) = d\dz n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(4,i,i_state) = n_alpha(r_i,istate) one_body_grad_2_dm_alpha_at_r(i,istate)      = d\dx n_alpha(r_i,istate)^2 + d\dy n_alpha(r_i,istate)^2 + d\dz n_alpha(r_i,istate)^2 where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_dm_and_grad_beta_in_r

    .. code:: text

        double precision, allocatable	:: one_dm_and_grad_alpha_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_dm_and_grad_beta_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_grad_2_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_body_grad_2_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_dm_and_grad_alpha_in_r(1,i,i_state) = d\dx n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(2,i,i_state) = d\dy n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(3,i,i_state) = d\dz n_alpha(r_i,istate) one_dm_and_grad_alpha_in_r(4,i,i_state) = n_alpha(r_i,istate) one_body_grad_2_dm_alpha_at_r(i,istate)      = d\dx n_alpha(r_i,istate)^2 + d\dy n_alpha(r_i,istate)^2 + d\dz n_alpha(r_i,istate)^2 where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_dm_beta_in_r

    .. code:: text

        double precision, allocatable	:: one_dm_alpha_in_r	(n_points_integration_angular,n_points_radial_grid,nucl_num,N_states)
        double precision, allocatable	:: one_dm_beta_in_r	(n_points_integration_angular,n_points_radial_grid,nucl_num,N_states)

    File: :file:`dm_in_r.irp.f`

    




.. c:var:: one_e_dm_alpha_at_r

    .. code:: text

        double precision, allocatable	:: one_e_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_e_dm_alpha_at_r(i,istate) = n_alpha(r_i,istate) one_e_dm_beta_at_r(i,istate) =  n_beta(r_i,istate) where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_e_dm_alpha_in_r

    .. code:: text

        double precision, allocatable	:: one_e_dm_alpha_in_r	(n_points_integration_angular,n_points_radial_grid,nucl_num,N_states)
        double precision, allocatable	:: one_e_dm_beta_in_r	(n_points_integration_angular,n_points_radial_grid,nucl_num,N_states)

    File: :file:`dm_in_r.irp.f`

    




.. c:var:: one_e_dm_and_grad_alpha_in_r

    .. code:: text

        double precision, allocatable	:: one_e_dm_and_grad_alpha_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_dm_and_grad_beta_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_grad_2_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_grad_2_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_e_dm_and_grad_alpha_in_r(1,i,i_state) = d\dx n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(2,i,i_state) = d\dy n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(3,i,i_state) = d\dz n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(4,i,i_state) = n_alpha(r_i,istate) one_e_grad_2_dm_alpha_at_r(i,istate)      = d\dx n_alpha(r_i,istate)^2 + d\dy n_alpha(r_i,istate)^2 + d\dz n_alpha(r_i,istate)^2 where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_e_dm_and_grad_beta_in_r

    .. code:: text

        double precision, allocatable	:: one_e_dm_and_grad_alpha_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_dm_and_grad_beta_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_grad_2_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_grad_2_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_e_dm_and_grad_alpha_in_r(1,i,i_state) = d\dx n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(2,i,i_state) = d\dy n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(3,i,i_state) = d\dz n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(4,i,i_state) = n_alpha(r_i,istate) one_e_grad_2_dm_alpha_at_r(i,istate)      = d\dx n_alpha(r_i,istate)^2 + d\dy n_alpha(r_i,istate)^2 + d\dz n_alpha(r_i,istate)^2 where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_e_dm_beta_at_r

    .. code:: text

        double precision, allocatable	:: one_e_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_e_dm_alpha_at_r(i,istate) = n_alpha(r_i,istate) one_e_dm_beta_at_r(i,istate) =  n_beta(r_i,istate) where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_e_dm_beta_in_r

    .. code:: text

        double precision, allocatable	:: one_e_dm_alpha_in_r	(n_points_integration_angular,n_points_radial_grid,nucl_num,N_states)
        double precision, allocatable	:: one_e_dm_beta_in_r	(n_points_integration_angular,n_points_radial_grid,nucl_num,N_states)

    File: :file:`dm_in_r.irp.f`

    




.. c:var:: one_e_grad_2_dm_alpha_at_r

    .. code:: text

        double precision, allocatable	:: one_e_dm_and_grad_alpha_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_dm_and_grad_beta_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_grad_2_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_grad_2_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_e_dm_and_grad_alpha_in_r(1,i,i_state) = d\dx n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(2,i,i_state) = d\dy n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(3,i,i_state) = d\dz n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(4,i,i_state) = n_alpha(r_i,istate) one_e_grad_2_dm_alpha_at_r(i,istate)      = d\dx n_alpha(r_i,istate)^2 + d\dy n_alpha(r_i,istate)^2 + d\dz n_alpha(r_i,istate)^2 where r_i is the ith point of the grid and istate is the state number




.. c:var:: one_e_grad_2_dm_beta_at_r

    .. code:: text

        double precision, allocatable	:: one_e_dm_and_grad_alpha_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_dm_and_grad_beta_in_r	(4,n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_grad_2_dm_alpha_at_r	(n_points_final_grid,N_states)
        double precision, allocatable	:: one_e_grad_2_dm_beta_at_r	(n_points_final_grid,N_states)

    File: :file:`dm_in_r.irp.f`

    one_e_dm_and_grad_alpha_in_r(1,i,i_state) = d\dx n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(2,i,i_state) = d\dy n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(3,i,i_state) = d\dz n_alpha(r_i,istate) one_e_dm_and_grad_alpha_in_r(4,i,i_state) = n_alpha(r_i,istate) one_e_grad_2_dm_alpha_at_r(i,istate)      = d\dx n_alpha(r_i,istate)^2 + d\dy n_alpha(r_i,istate)^2 + d\dz n_alpha(r_i,istate)^2 where r_i is the ith point of the grid and istate is the state number




Subroutines / functions
-----------------------



.. c:function:: density_and_grad_alpha_beta_and_all_aos_and_grad_aos_at_r

    .. code:: text

        subroutine density_and_grad_alpha_beta_and_all_aos_and_grad_aos_at_r(r,dm_a,dm_b, grad_dm_a, grad_dm_b, aos_array, grad_aos_array)

    File: :file:`dm_in_r.irp.f`

    input      : r(1) ==> r(1) = x, r(2) = y, r(3) = z output     : dm_a = alpha density evaluated at r : dm_b = beta  density evaluated at r : aos_array(i) = ao(i) evaluated at r : grad_dm_a(1) = X gradient of the alpha density evaluated in r : grad_dm_a(1) = X gradient of the beta  density evaluated in r : grad_aos_array(1) = X gradient of the aos(i) evaluated at r





.. c:function:: dm_dft_alpha_beta_and_all_aos_at_r

    .. code:: text

        subroutine dm_dft_alpha_beta_and_all_aos_at_r(r,dm_a,dm_b,aos_array)

    File: :file:`dm_in_r.irp.f`

    input: r(1) ==> r(1) = x, r(2) = y, r(3) = z output : dm_a = alpha density evaluated at r output : dm_b = beta  density evaluated at r output : aos_array(i) = ao(i) evaluated at r





.. c:function:: dm_dft_alpha_beta_at_r

    .. code:: text

        subroutine dm_dft_alpha_beta_at_r(r,dm_a,dm_b)

    File: :file:`dm_in_r.irp.f`

    input: r(1) ==> r(1) = x, r(2) = y, r(3) = z output : dm_a = alpha density evaluated at r(3) output : dm_b = beta  density evaluated at r(3)


