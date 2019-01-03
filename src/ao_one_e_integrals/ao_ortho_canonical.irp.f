 BEGIN_PROVIDER [ double precision, ao_cart_to_sphe_coef, (ao_num,ao_num)]
&BEGIN_PROVIDER [ integer, ao_cart_to_sphe_num ]
  implicit none
  BEGIN_DOC
! Coefficients to go from cartesian to spherical coordinates in the current
! basis set
  END_DOC
  integer :: i
  integer, external              :: ao_power_index
  integer                        :: ibegin,j,k
  ao_cart_to_sphe_coef(:,:) = 0.d0
  ! Assume order provided by ao_power_index
  i = 1
  ao_cart_to_sphe_num = 0
  do while (i <= ao_num)
    select case ( ao_l(i) )
      case (0)
        ao_cart_to_sphe_num += 1
        ao_cart_to_sphe_coef(i,ao_cart_to_sphe_num) = 1.d0
        i += 1
      BEGIN_TEMPLATE
      case ($SHELL)
        if (ao_power(i,1) == $SHELL) then
          do k=1,size(cart_to_sphe_$SHELL,2)
            do j=1,size(cart_to_sphe_$SHELL,1)
              ao_cart_to_sphe_coef(i+j-1,ao_cart_to_sphe_num+k) = cart_to_sphe_$SHELL(j,k)
            enddo
          enddo
          i += size(cart_to_sphe_$SHELL,1)
          ao_cart_to_sphe_num += size(cart_to_sphe_$SHELL,2)
        endif
      SUBST [ SHELL ]
        1;;
        2;;
        3;;
        4;;
        5;;
        6;;
        7;;
        8;;
        9;;
      END_TEMPLATE
      case default
        stop 'Error in ao_cart_to_sphe : angular momentum too high'
    end select
  enddo

END_PROVIDER

BEGIN_PROVIDER [ double precision, ao_cart_to_sphe_overlap, (ao_cart_to_sphe_num,ao_cart_to_sphe_num) ]
 implicit none
 BEGIN_DOC
 ! |AO| overlap matrix in the spherical basis set
 END_DOC
 double precision, allocatable :: S(:,:)
 allocate (S(ao_cart_to_sphe_num,ao_num))

 call dgemm('T','N',ao_cart_to_sphe_num,ao_num,ao_num, 1.d0, &
   ao_cart_to_sphe_coef,size(ao_cart_to_sphe_coef,1), &
   ao_overlap,size(ao_overlap,1), 0.d0, &
   S, size(S,1))

 call dgemm('N','N',ao_cart_to_sphe_num,ao_cart_to_sphe_num,ao_num, 1.d0, &
   S, size(S,1), &
   ao_cart_to_sphe_coef,size(ao_cart_to_sphe_coef,1), 0.d0, &
   ao_cart_to_sphe_overlap,size(ao_cart_to_sphe_overlap,1))

 deallocate(S)

END_PROVIDER

BEGIN_PROVIDER [ double precision, ao_cart_to_sphe_inv, (ao_cart_to_sphe_num,ao_num) ]
 implicit none
 BEGIN_DOC
 ! Inverse of :c:data:`ao_cart_to_sphe_coef`
 END_DOC

 call get_pseudo_inverse(ao_cart_to_sphe_coef,size(ao_cart_to_sphe_coef,1),&
   ao_num,ao_cart_to_sphe_num, &
   ao_cart_to_sphe_inv, size(ao_cart_to_sphe_inv,1))
END_PROVIDER



BEGIN_PROVIDER [ double precision, ao_ortho_canonical_coef_inv, (ao_num,ao_num)]
 implicit none
 BEGIN_DOC
! ao_ortho_canonical_coef^(-1)
 END_DOC
 call get_inverse(ao_ortho_canonical_coef,size(ao_ortho_canonical_coef,1),&
     ao_num, ao_ortho_canonical_coef_inv, size(ao_ortho_canonical_coef_inv,1))
END_PROVIDER

 BEGIN_PROVIDER [ double precision, ao_ortho_canonical_coef, (ao_num,ao_num)]
&BEGIN_PROVIDER [ integer, ao_ortho_canonical_num ]
  implicit none
  BEGIN_DOC
! matrix of the coefficients of the mos generated by the 
! orthonormalization by the S^{-1/2} canonical transformation of the aos
! ao_ortho_canonical_coef(i,j) = coefficient of the ith ao on the jth ao_ortho_canonical orbital
  END_DOC
  integer :: i
  ao_ortho_canonical_coef = 0.d0
  do i=1,ao_num
    ao_ortho_canonical_coef(i,i) = 1.d0
  enddo

!call ortho_lowdin(ao_overlap,size(ao_overlap,1),ao_num,ao_ortho_canonical_coef,size(ao_ortho_canonical_coef,1),ao_num)
!ao_ortho_canonical_num=ao_num
!return

  if (ao_cartesian) then

    ao_ortho_canonical_num = ao_num
    call ortho_canonical(ao_overlap,size(ao_overlap,1), &
      ao_num,ao_ortho_canonical_coef,size(ao_ortho_canonical_coef,1), &
      ao_ortho_canonical_num)


  else

    double precision, allocatable :: S(:,:)

    allocate(S(ao_cart_to_sphe_num,ao_cart_to_sphe_num))
    S = 0.d0
    do i=1,ao_cart_to_sphe_num
      S(i,i) = 1.d0
    enddo

    ao_ortho_canonical_num = ao_cart_to_sphe_num
    call ortho_canonical(ao_cart_to_sphe_overlap, size(ao_cart_to_sphe_overlap,1), &
      ao_cart_to_sphe_num, S, size(S,1), ao_ortho_canonical_num)

    call dgemm('N','N', ao_num, ao_ortho_canonical_num, ao_cart_to_sphe_num, 1.d0, &
      ao_cart_to_sphe_coef, size(ao_cart_to_sphe_coef,1), &
      S, size(S,1), &
      0.d0, ao_ortho_canonical_coef, size(ao_ortho_canonical_coef,1))

    deallocate(S)
  endif
END_PROVIDER

BEGIN_PROVIDER [double precision, ao_ortho_canonical_overlap, (ao_ortho_canonical_num,ao_ortho_canonical_num)]
  implicit none
  BEGIN_DOC
! overlap matrix of the ao_ortho_canonical.
! Expected to be the Identity
  END_DOC
  integer                        :: i,j,k,l
  double precision               :: c
  do j=1, ao_ortho_canonical_num
    do i=1, ao_ortho_canonical_num
      ao_ortho_canonical_overlap(i,j) = 0.d0
    enddo
  enddo
  do j=1, ao_ortho_canonical_num
    do k=1, ao_num
      c = 0.d0
      do l=1, ao_num
        c +=  ao_ortho_canonical_coef(l,j) * ao_overlap(l,k)
      enddo
      do i=1, ao_ortho_canonical_num
        ao_ortho_canonical_overlap(i,j) += ao_ortho_canonical_coef(k,i) * c
      enddo
    enddo
  enddo
END_PROVIDER
