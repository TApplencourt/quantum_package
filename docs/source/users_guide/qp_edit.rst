.. _qp_edit:

qp_edit
=======

.. TODO

Usage ::

    qp_edit EZFIO_DIRECTORY


Flags ::

    [-c]           Checks the input data
    [-ndet int]    Truncate the wavefunction to the target number of determinants
    [-state int]   Pick the state as a new wavefunction.
    [-help]        print this help text and exit
                   (alias: -?)

This command reads the content of the |EZFIO| directory and creates a temporary
file containing the data. The data is presented as a *ReStructured Text* (rst)
document, where each section corresponds to the corresponding |qp| module.
The content of the file can be modified to change the input parameters. When
the text editor is closed, the updated data is saved into the |EZFIO| directory.

.. warning::
   When the wave function is too large (more than 10 000 determinants), the
   determinants are not displayed.

Here is a short list of important control parameters :

read_wf
   If ``false``, initialize the calculation with a single-determinant wave
   function. If ``true``, initialize the calculation with the wave function stored
   in the |EZFIO| directory.



