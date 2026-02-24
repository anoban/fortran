module routines
   use iso_fortran_env
   implicit none

contains

   pure function factorial(n) result(res) ! a function that doesn't mutate it's arguments can be declared as a pure function
      ! helps the compiler with optimizations
      integer(kind=int64), intent(in) :: n
      integer(kind=int64) :: i
      real(kind=real64) :: res
      res = 1.0000

      if(n <= 0) return ! res will be 1.000

      do i =1, n
         res = res * i
      end do

   end function factorial

   integer(kind=int64) pure function gcd(x, y) ! an alternative function signature (quite similar to C style)
      integer(kind=int64), intent(in) :: x, y
      integer(kind=int64) :: smallest, i

      if (x == y) then ! if both values are identical, return
         gcd = x
         return
      else if (x < y) then ! find the smallest out of the two values
         smallest = x
      else
         smallest = y
      end if

      do i = smallest, 1, -1 !
         if(mod(x, i)==0 .and. mod(y, i)==0) then
            gcd = i
            return
         end if
      end do

   end function gcd

end module routines

program functions
   use iso_fortran_env
   use routines
   implicit none
   integer(kind=int64) :: i

   do i=0, 100
      print *, "Factorial of ", i, " is ", factorial(i)
      print *, "GCD of ", i, " and 44 is ", gcd(i, 44_int64)
   end do

end program functions
