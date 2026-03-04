program matrices
    use iso_fortran_env
    implicit none
    real(kind=real32), allocatable :: matrix(:, :)
    integer(kind=int32) :: i, j

    allocate(matrix(20, 20))
    call random_number(matrix)

    do i = 1, 20
        do j = 1, 20
            print "(F5.3)", matrix(i, j) ! cannot avoid the newline getting printed with print, use write instead
        end do
    end do

    deallocate(matrix)

end program matrices
