External plugins
----------------

.. TODO

The |qp| has very few executables out of the box. Most of the time, external
plugins need to be downloaded and copied in the ``$QP_ROOT/plugins`` directory.
The ``qp_module`` script will be needed::

       qp_module create -n NAME [CHILDREN_MODULE...]
       qp_module install NAME ...
       qp_module uninstall NAME


For example you can type ::

   qp_module install QMCChem

This will install the `QMCChem` module. All the modules are installed in the
``$QP_ROOT/src/``, and all the available modules are in ``$QP_ROOT/plugins/``.



