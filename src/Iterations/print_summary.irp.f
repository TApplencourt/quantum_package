subroutine print_summary(e_,pt2_,error_,variance_,norm_)
  implicit none
  BEGIN_DOC
! Print the extrapolated energy in the output
  END_DOC

  double precision, intent(in)   :: e_(N_states), pt2_(N_states), variance_(N_states), norm_(N_states), error_(N_states)
  integer                        :: i, k
  integer                        :: N_states_p
  character*(9)                  :: pt2_string
  character*(512)                :: fmt
  double precision               :: f(N_states)

  if (do_pt2) then
    pt2_string = '        '
  else
    pt2_string = '(approx)'
  endif

  N_states_p = min(N_det,N_states)

  do i=1,N_states_p
    f(i) = 1.d0/(1+norm_(i))
  enddo

  print *, ''
  print '(A,I12)',  'Summary at N_det = ', N_det
  print '(A)',      '-----------------------------------'
  print *, ''

  write(fmt,*) '(''# ============'',', N_states_p, '(1X,''=============================''))'
  write(*,fmt)
  write(fmt,*) '(12X,', N_states_p, '(6X,A7,1X,I6,10X))'
  write(*,fmt) ('State',k, k=1,N_states_p)
  write(fmt,*) '(''# ============'',', N_states_p, '(1X,''=============================''))'
  write(*,fmt)
  write(fmt,*) '(A12,', N_states_p, '(1X,F14.8,15X))'
  write(*,fmt) '# E          ', e_(1:N_states_p)
  if (N_states_p > 1) then
    write(*,fmt) '# Excit. (au)', e_(1:N_states_p)-e_(1)
    write(*,fmt) '# Excit. (eV)', (e_(1:N_states_p)-e_(1))*27.211396641308d0
  endif
  write(fmt,*) '(A13,', 2*N_states_p, '(1X,F14.8))'
  write(*,fmt) '# PT2'//pt2_string, (pt2_(k), error_(k), k=1,N_states_p)
  write(*,'(A)') '#'
  write(*,fmt) '# E+PT2      ', (e_(k)+pt2_(k),error_(k), k=1,N_states_p)
  write(*,fmt) '# E+rPT2     ', (e_(k)+pt2_(k)*f(k),error_(k)*f(k), k=1,N_states_p)
  if (N_states_p > 1) then
    write(*,fmt) '# Excit. (au)', ( (e_(k)+pt2_(k)-e_(1)-pt2_(1)), &
      dsqrt(error_(k)*error_(k)+error_(1)*error_(1)), k=1,N_states_p)
    write(*,fmt) '# Excit. (eV)', ( (e_(k)+pt2_(k)-e_(1)-pt2_(1))*27.211396641308d0, &
      dsqrt(error_(k)*error_(k)+error_(1)*error_(1))*27.211396641308d0, k=1,N_states_p)
  endif
  write(fmt,*) '(''# ============'',', N_states_p, '(1X,''=============================''))'
  write(*,fmt)
  print *,  ''

  print *,  'N_det             = ', N_det
  print *,  'N_states          = ', N_states

  do k=1, N_states_p
    print*,'State ',k
    print *,  'Variance        = ', variance_(k) 
    print *,  'PT norm         = ', dsqrt(norm_(k))
    print *,  'PT2             = ', pt2_(k)
    print *,  'E               = ', e_(k)
    print *,  'E+PT2 '//pt2_string//'  = ', e_(k)+pt2_(k), ' +/- ', error_(k)
    print *,  'E+rPT2'//pt2_string//'  = ', e_(k)+pt2_(k)*f(k), ' +/- ', error_(k)*f(k)
  enddo

  print *,  '-----'
  if(N_states.gt.1)then
    print *, 'Variational Energy difference (au | eV)'
    do i=2, N_states_p
      print*,'Delta E = ', (e_(i) - e_(1)), &
        (e_(i) - e_(1)) * 27.211396641308d0
    enddo
    print *,  '-----'
    print*, 'Variational + perturbative Energy difference (au | eV)'
    do i=2, N_states_p
      print*,'Delta E = ', (e_(i)+ pt2_(i) - (e_(1) + pt2_(1))), &
        (e_(i)+ pt2_(i) - (e_(1) + pt2_(1))) * 27.211396641308d0
    enddo
    print *,  '-----'
    print*, 'Variational + renormalized perturbative Energy difference (au | eV)'
    do i=2, N_states_p
      print*,'Delta E = ', (e_(i)+ pt2_(i)*f(i) - (e_(1) + pt2_(1)*f(1))), &
        (e_(i)+ pt2_(i)*f(i) - (e_(1) + pt2_(1)*f(1))) * 27.211396641308d0
    enddo
  endif

end subroutine 

