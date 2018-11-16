
![QP](https://raw.githubusercontent.com/LCPQ/quantum_package/master/data/qp.png)     
[![Build Status](https://travis-ci.org/LCPQ/quantum_package.svg?branch=master)](https://travis-ci.org/LCPQ/quantum_package)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/LCPQ/quantum_package?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Set of quantum chemistry programs and libraries. 
(under GNU GENERAL PUBLIC LICENSE v2)

For more information, you can visit the [wiki of the project](http://github.com/LCPQ/quantum_package/wiki), or below for the installation instructions.



Demo
====

[![Full-CI energy of C2 in 2 minutes](https://i.vimeocdn.com/video/555047954_295x166.jpg)](https://vimeo.com/scemama/quantum_package_demo "Quantum Package Demo")

[![Frozen-core Full-CI energy of Ti](https://raw.githubusercontent.com/LCPQ/quantum_package/master/data/Titanium.png)](https://raw.githubusercontent.com/LCPQ/quantum_package/master/data/Titanium.png "Convergence of Ti in cc-pv{DTQ}Z")

# Installation

See [INSTALL.rst].

# Note on EZFIO.cfg

## Format specification:

```
Required:
    [<provider_name>]   The name of the provider in irp.f90 and in the EZFIO lib
    doc:<str>           The plain text documentation
    type:<str>          A type supported by the OCaml.
                            type `ei_handler.py get_supported_type` for a list
    interface:<str>     The interface is a list of strings sepeared by ","  which can contain :
                          - ezfio : to build the EZFIO API
                          - provider : to build the corresponding providers 
                          - ocaml : to build the corresponding bindings in OCaml
Optional:
    default: <str>      The default value,
                            needed if 'ocaml' is in interface list.
                           ! No list is allowed for now !
    size: <str>         The size information.
                            (by default is one)
                            Example : 1; =sum(ao_num); (ao_num,3)
                            WARNING : The module and the value are separed by a "." not a "_".
                            For example (determinants.n_det)
    ezfio_name: <str>   The name in the EZFIO API
                             (by default is <provider_name>)
    ezfio_dir: <str>    Will be the directory of EZFIO.
                              (by default is <module_lower>)
```

## Example of EZFIO.cfg:

```
[thresh_SCF]
doc: Threshold on the convergence of the Hartree Fock energy
type: Threshold
default: 1.e-10
interface: provider,ezfio,ocaml
size: 1

[energy]
type: Strictly_negative_float
doc: Calculated HF energy
interface: ezfio
```

# FAQ

### My hartree-Fock segfault !

A old version of Lapack have a bug. Just relax your convergence criterium


### Error: ezfio_* is already defined.

#### Why ?

You have two or more ezfio configuration files for the same variable. Check files in `$QP_ROOT/install/EZFIO/config/` and the all the `EZFIO.cfg`.

#### Fix

    - rm $QP_ROOT/install/EZFIO/config/*
    - ninja 

### Error: Seg Fault (139)

```
Segmentation fault (core dumped)
Program exited with code 139.
```

#### Why ?

It's caused when we call the DGEMM routine of LAPACK. 

#### Fix

Set `ulimit -s unlimited`, before runing `qp_run`. It seems to fix the problem.

#### Error: f77zmq not symbol found

In the Makefile of the f77zmq, you should NOT use ar but `libtool -static`
