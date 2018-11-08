Selected Configuration Interaction
==================================

These methods rely on the same principle as the usual CI approaches, except
that determinants aren't chosen *a priori* based on an occupation or
excitation criterion, but selected *on the fly* among the entire set of
determinants based on their estimated contribution to the Full-CI wave function.
Conventional CI methods can be seen as an exact resolution of Schrödinger's
equation for a complete, well-defined subset of determinants (and for a given
atomic basis set), while selected CI methods are closer to a truncation of the
Full-CI.

It has been noticed long ago that, even inside a predefined subspace of
determinants, only a small number significantly contributes to the wave
function.:cite:`Bytautas_2009,Anderson_2018` Therefore, an *on the fly*
selection of determinants is a rather natural idea that has been proposed
in the late 60's by Bender and Davidson :cite:`Bender_1969` as well as Whitten
and Hackmeyer :cite:`Whitten_1969`.

The approach we are using in the |qp| is based on :abbr:`CIPSI (Configuration
Interaction using a Perturbative Selection` developed by Huron, Rancurel and
Malrieu,:cite:`Huron_1973` that iteratively selects *external* determinants
|kalpha| (determinants which are not present in the wave
function :math:`|\Psi \rangle = \sum_i c_i |i \rangle`) using a perturbative
criterion

.. math::

   e_\alpha = \frac{\langle \Psi |{\hat H}| \alpha \rangle^2 }{E - H_{\alpha\alpha}}

with |kalpha| the external determinant being considered, and |ealpha| the
estimated gain in correlation energy that would be brought by the inclusion of
|kalpha| in the wave function. |EPT| is an estimation of the total missing
correlation energy:

.. math::

   \begin{align}
   E_\text{PT2} & = \sum_{\alpha} e_\alpha \\
   E_\text{FCI} & \approx E + E_\text{PT2} 
   \end{align}

There is however a computational downside. In \textit{a priori} selected
methods, the rule by which determinants are selected is known \textit{a
priori}, and therefore, one can map a particular determinant to some row or
column index.\cite{Knowles_1984} As a consequence, it can be systematically
determined to which matrix element of $\widehat{H}$ a two-electron integral
contributes. This allows for the implementation of so-called
\emph{integral-driven} methods, that work essentially by iterating over
integrals.

On the contrary, in selected methods an explicit list has to be maintained, and
there is no immediate way to know whether a determinant has been selected, or
what its index is. Consequently, so-called \emph{determinant-driven} approaches
will be used, in which iteration is done over determinants rather than
integrals. This can be a lot more expensive, since the number of determinants
is typically much larger than the number of integrals. The number of
determinants scales as $\order{\Norb!}$ while the number of integrals scales as
$\order{\Norb^4}$ with the number of MOs.

Furthermore, determinant-driven methods require an effective way to compare
determinants in order to extract the corresponding excitation operators, and a
way to rapidly fetch the associated integrals involved
section~\ref{sec:meth_mel}.

Because of this high computational cost, approximations have been
proposed.\cite{Evangelisti_1983} And recently, the \emph{Heat-Bath
Configuration Interaction (HCI)} algorithm has taken farther the idea of a more
approximate but extremely cheap selection.\cite{Holmes_2016, Sharma_2017}
Compared to CIPSI, the selection criterion is simplified to

.. math::

   e^{\text{HCI}}_\alpha = \max \qty( \qty| c_I \Hij{D_I}{\alpha} | )

This algorithmically allows for an extremely fast selection of doubly
excited determinants by an integral-driven approach.

Full Configuration Interaction Quantum Monte Carlo (FCI-QMC) is an alternate
approach to selection recently proposed in 2009 by Alavi \textit{et
al.},\cite{Booth_2009,Booth_2010,Cleland_2010} where signed walkers spawn from
one determinant to connected ones, with a probability that is a function of the
associated matrix element. The average proportion of walkers on a determinant
converges to its coefficient in the FCI wave function.


.. |kalpha| replace:: :math:`| \alpha \rangle`
.. |ealpha| replace:: :math:`e_\alpha `
.. |EPT| replace:: :math:`E_{\text PT2}`

