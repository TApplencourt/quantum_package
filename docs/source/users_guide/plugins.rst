External plugins
----------------

.. TODO

The |qp| has very few executables out of the box. Most of the time, external
plugins need to be downloaded and copied in the ``$QP_ROOT/plugins`` directory.
The ``qp_module.py`` script will be needed::

       qp_module.py create -n NAME [CHILDREN_MODULE...]
       qp_module.py install NAME ...
       qp_module.py uninstall NAME


For example you can type ::

   qp_module.py install QMCChem

This will install the `QMCChem` module. All the modules are installed in the
``$QP_ROOT/src/``, and all the available modules are in ``$QP_ROOT/plugins/``.



