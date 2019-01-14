.. _iterations:

.. program:: iterations

.. default-role:: option

==========
iterations
==========

Module which saves the computed energies for an extrapolation to
the |FCI| limit.



EZFIO parameters
----------------

.. option:: n_iter

    Number of saved iterations

    Default: 1

.. option:: n_det_iterations

    Number of determinants at each iteration


.. option:: energy_iterations

    The variational energy at each iteration


.. option:: pt2_iterations

    The |PT2| correction at each iteration



Providers
---------


.. c:var:: extrapolated_energy

    .. code:: text

        double precision, allocatable	:: extrapolated_energy	(N_iter,N_states)

    File: :file:`iterations.irp.f`

    Extrapolated energy, using E_var = f(PT2) where PT2=0




.. c:var:: n_iter

    .. code:: text

        integer	:: n_iter

    File: :file:`io.irp.f`

    number of iterations




Subroutines / functions
-----------------------



.. c:function:: print_extrapolated_energy

    .. code:: text

        subroutine print_extrapolated_energy

    File: :file:`print_extrapolation.irp.f`

    Print the extrapolated energy in the output





.. c:function:: print_summary

    .. code:: text

        subroutine print_summary(e_,pt2_,error_,variance_,norm_,n_det_,n_occ_pattern_,n_st)

    File: :file:`print_summary.irp.f`

    Print the extrapolated energy in the output





.. c:function:: save_iterations

    .. code:: text

        subroutine save_iterations(e_, pt2_,n_)

    File: :file:`iterations.irp.f`

    Update the energy in the EZFIO file.


