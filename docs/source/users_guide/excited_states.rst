Excited states
==============

.. TODO

It is possible to run excited states calculations with the quantum package.  To
do this, set the ``n_states`` variable in the ``Determinants`` section to the
number of requested states.  The selection criterion will be the maximum of the
selection criteria for each state.  If the Davidson diagonalization has
difficulties to converge, increase the ``n_states_diag`` variable in the
``Davidson`` section.

When computing multiple states, it is good to have the ``s2_eig`` flag of the
``Determinants`` section set to ``true``. This will force the Davidson algorithm to
choose only vectors with a value of S^2 equal to the ``expected_s2``.
Otherwise, different spin states will come out in the diagonalization.

The Quantum Package doesn't take account of the symmetry. Due to numerical
noise, excited states of different symmetries may enter in the calculation.
Note that it is possible to make state-average calculation of states with
different symmetries and/or different spin multiplicities.

To include excited state of  all possible symmetries, a simple trick is to
run a preliminary multi-state CIS calculation, and then running the selected
FCI restarting from the CIS states, setting the ``read_wf`` flag of the
``Determinants`` section to ``true``.

Usually, it is good practice to use state-averaged MOs so that all states have
MOs of comparable quality. For example, when searching for a singly excited
state, one can use state-average natural orbitals of a preliminary CIS
calculation.


