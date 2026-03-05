module utils
    use iso_fortran_env
    implicit none

contains

    subroutine mprint(matrix)
        real, intent(in) :: matrix(:, :)
        integer(kind=int32) :: i, j

        do i = 1, shape(matrix)(2)
            write(OUTPUT_UNIT, "('[ ')", advance = "no")
            do j = 1, shape(matrix)(1)
                write(OUTPUT_UNIT, "(F5.3, ', ')", advance = "no") matrix(i, j)
            end do
            print*, " ]"
        end do

    end subroutine mprint

end module utils


program matrices
    use iso_fortran_env
    use utils
    implicit none
    real(kind=real32), allocatable :: matrix(:, :), tensor(:, :, :)
    integer(kind=int32) :: i, j

    allocate(matrix(20, 20)) ! 2D
    allocate(tensor(20, 20, 20)) ! 3D
    call random_number(matrix)

    do i = 1, 20
        write(OUTPUT_UNIT, "('[ ')", advance = "no")
        do j = 1, 20
            ! print "(F5.3)", matrix(i, j) ! cannot avoid the newline getting printed with print, use write instead
            write(OUTPUT_UNIT, "(F5.3, ', ')", advance = "no") matrix(i, j)
        end do
        print*, " ]"
    end do

    print *, matrix ! the output format of this call seems compiler dependent, ifx prints a formatted matrix while flang just spits out a messy array
    call mprint(matrix)


    deallocate(matrix)
    deallocate(tensor)

end program matrices
