.. _fci:

.. program:: fci

.. default-role:: option

===
fci
===

|CIPSI| algorithm in the full configuration interaction space.

* :command:`fci` performs the |CIPSI| calculation,
* :command:`pt2` computes the |PT2| contribution using the wave function stored in the |EZFIO|
  database.

.. seealso::

    The documentation of the :ref:`cipsi` module.





EZFIO parameters
----------------

.. option:: energy

    Calculated Selected |FCI| energy


.. option:: energy_pt2

    Calculated |FCI| energy + |PT2|



Providers
---------


.. c:var:: nthreads_pt2

    .. code:: text

        integer	:: nthreads_pt2

    File: :file:`environment.irp.f`

    Number of threads for Davidson




Subroutines / functions
-----------------------



.. c:function:: fci

    .. code:: text

        subroutine fci

    File: :file:`fci.irp.f`

    Selected Full Configuration Interaction with stochastic selection and PT2. 

    This program performs a CIPSI-like selected CI using a stochastic scheme for both 

    the selection of the important Slater determinants and the computation of the PT2 correction. 

    This CIPSI-like algorithm will be performed for the "n_states" lowest states of the variational space (see :option:`determinants n_det_max`) 

    The fci program will stop when reaching at least one the two following conditions: 

    * number of Slater determinant > "n_det_max" (see :option:`determinants n_det_max`) 

    * |PT2| < "pt2_max" (see :option:`perturbation pt2_max`) 

    

    The following other options can be of interest: 

    If "read_wf" = False, it starts with a ROHF-like Slater determinant as a guess wave function. 

    If "read_wf" = True , it starts with the wave function(s) stored in the EZFIO folder as guess wave function(s). 

    (see :option:`determinants read_wf`) 

    If "s2_eig" = True, it will systematically add all necessary Slater determinants in order 

    to have a pure spin wave function with an :math:`S^2` value corresponding to "expected_s2". 

    (see :option:`determinants s2_eig` and :option:`determinants expected_s2`) 

    

    

    

    For excited states calculations, it is recommended to start with a cis or cisd guess wave functions 

    for the "n_states", and to set "s2_eig" = True.





.. c:function:: pt2

    .. code:: text

        subroutine pt2

    File: :file:`pt2.irp.f`

    Second order perturbative correction to the wave function contained in the EZFIO directory. 

    This programs runs the stochastic PT2 correction on all "n_states" wave function stored in the EZFIO folder (see :option:`determinant n_states`). 

    The option for the PT2 correction are the "pt2_relative_error" which is the relative stochastic 

    error on the PT2 to reach before stopping the stochastic sampling. (see :option:`perturbation pt2_relative_error`)





.. c:function:: save_energy

    .. code:: text

        subroutine save_energy(E,pt2)

    File: :file:`save_energy.irp.f`

    Saves the energy in |EZFIO|.


