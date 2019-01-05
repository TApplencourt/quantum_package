BEGIN_PROVIDER [double precision, mo_kinetic_integrals, (mo_num,mo_num)]
  implicit none
  BEGIN_DOC
  !  Kinetic energy integrals in the MO basis
  END_DOC

  if (read_mo_integrals_kinetic) then
    call ezfio_get_mo_one_e_ints_mo_integrals_kinetic(mo_kinetic_integrals)
    print *,  'MO kinetic integrals read from disk'
  else
    call ao_to_mo(                                                   &
        ao_kinetic_integrals,                                         &
        size(ao_kinetic_integrals,1),                                 &
        mo_kinetic_integrals,                                         &
        size(mo_kinetic_integrals,1)                                  &
        )
  endif
  if (write_mo_integrals_kinetic) then
    call ezfio_set_mo_one_e_ints_mo_integrals_kinetic(mo_kinetic_integrals)
    print *,  'MO kinetic integrals written to disk'
  endif

END_PROVIDER

