program hello
   implicit none
   integer :: i
   integer, parameter :: MAX_ITERATIONS = 100

   do i = 1, MAX_ITERATIONS, 2
      print *, i, "Hello there!"
   end do

end program hello
