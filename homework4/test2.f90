! Modified from test1.f90
! Ryan (Weiran) Zhao 
! Wed,Jun 26th 2013 09:10:31 PM EDT
program test2

    use quadrature, only: trapezoid, error_table

    implicit none
    real(kind=8) :: a,b,int_true
    integer :: nvals(12), i
    ! add ocsilation impact k
    integer :: k=1000

    a = 0.d0
    b = 2.d0
    int_true = (b-a) + (b**4 - a**4) / 4.d0 - (1.d0/k)* (dcos(k*b)-dcos(k*a))

    print 10, int_true
 10 format("true integral: ", es22.14)
    print *, " "  ! blank line

    ! values of n to test:
    do i=1,12
        nvals(i) = 5 * 2**(i-1)
        enddo

    call error_table(f, a, b, nvals, int_true)

contains

    real(kind=8) function f(x)
        implicit none
        real(kind=8), intent(in) :: x 
        
        f = 1.d0 + x**3 + dsin(1000*x)
    end function f

end program test2
