subroutine apply_mono(i_hole,i_particle,ispin_excit,key_in,Nint)
 implicit none
 integer, intent(in) :: i_hole,i_particle,ispin_excit,Nint
 integer(bit_kind), intent(inout) :: key_in(Nint,2)
 integer :: k,j
 use bitmasks
 ! hole
 k = shiftr(i_hole-1,bit_kind_shift)+1  
 j = i_hole-shiftl(k-1,bit_kind_shift)-1
 key_in(k,ispin_excit) = ibclr(key_in(k,ispin_excit),j)

 k = shiftr(i_particle-1,bit_kind_shift)+1  
 j = i_particle-shiftl(k-1,bit_kind_shift)-1
 key_in(k,ispin_excit) = ibset(key_in(k,ispin_excit),j)

end
