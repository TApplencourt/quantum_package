========
The |qp|
========

.. image:: ../_static/qp.png
   :align: center
   :alt: Quantum Package


What it is
==========

The |qp| is an open-source programming environment for quantum chemistry,
especially for `wave function methods <https://en.wikipedia.org/wiki/Ab_initio_quantum_chemistry_methods>`_.
The main goal is the development of selected configuration interaction (sCI)
methods and multi-reference perturbation theory (MR-PT) in the
determinant-driven paradigm.  The determinant-driven framework allows the
programmer to include any arbitrary set of determinants in the variational
space, and thus gives a complete freedom in the methodological development. All
the programs are developed with the `IRPF90`_ code generator, which simplifies
the collaborative development, and the development of new features.



What it is not
==============

The |qp| is *not* a general purpose quantum chemistry program.
First of all, it is a library. The users of the |qp| should develop
their own programs.

The |qp| has been designed specifically for sCI, so all the
algorithms which are programmed are not adapted to run SCF or DFT calculations
on thousands of atoms. Currently, the systems targeted have less than 600
molecular orbitals.

The |qp| is *not* a massive production code. For conventional
methods such as Hartree-Fock, CISD or MP2, the users are recommended to use the
existing standard production codes which are designed to make these methods run
fast. Again, the role of the |qp| is to make life simple for the
developer. Once a new method is developed and tested, the developer is encouraged
to consider re-expressing it with an integral-driven formulation, and to 
implement the new method in open-source production codes, such as `NWChem`_
or |GAMESS|.


A few examples of applications
==============================

Multiple programs were developed with the |qp|, such as:

- Selected Full-CI + Epstein-Nesbet PT2 (CIPSI) :cite:`Caffarel_2016,Caffarel_2016.2,Loos_2018,Scemama_2018,Dash_2018`
- Hybrid stochastic/deterministic MR-PT2 :cite:`Garniron_2017.2,Loos_2018`
- CIS, CISD, MP2
- Selected CISD
- Jeziorsky-Monkhorst MR-PT2 :cite:`Giner_2017`
- Selected CAS+SD
- Selected difference-dedicated CI (DD-CI)
- Multi-Reference Coupled Cluster (MR-CCSD) :cite:`Giner_2016,Garniron_2017`
- Shifted-Bk with CIPSI :cite:`Garniron_2018`
- CIPSI with range-separated DFT

All these programs can generate ground and excited states, and spin pure wave
functions (eigenstates of |S^2|).



