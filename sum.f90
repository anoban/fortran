program sum_ ! the suffix _ is to avoid the program name shadowing the fortran intrinsic function named sum
   use iso_fortran_env
   implicit none
   integer(kind=int64) :: i
   integer(kind=int64), parameter :: LENGTH = 10000
   real(kind=real64) :: total = 0
   real(kind=real64), allocatable :: array(:) ! a heap allocatble vector of 64 bit doubles

   allocate(array(LENGTH)) ! allocate memory for 10000 doubles
   call random_number(array) ! populate the vector with pseudo random numbers

   do i = 1, LENGTH
      total = total + array(i)
   end do

   print *, "Sum of the ", LENGTH, " random numbers is ", sum(array)
   print *, "Sum of the ", LENGTH, " random numbers is ", total

   if (allocated(array)) deallocate(array)

end program sum_
