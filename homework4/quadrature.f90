! module for doing quadrature using trapezoid rule
! Ryan (Weiran) Zhao 
! Wed,Jun 26th 2013 07:51:57 PM EDT
module quadrature
    implicit none

contains

    real(kind=8) function trapezoid(f,a,b,n)
        ! used to calculate numerical quaduture of function 'f'
        ! using trapezoidal method
        ! Arguments:
        ! f:    function to be integrated
        ! a:    starting point of function to be evaluated from
        ! b:    end point
        ! n:    number of points to use, the bigger n, the more accurate

        implicit none
        real(kind=8), intent(in)::  a, b
        real(kind=8), external:: f
        integer, intent(in):: n
        ! local variables
        real(kind=8) h
        real(kind=8), dimension(n) :: x_val, f_val
        integer :: i

        h = (b-a)/(n-1)
        do i=1,n
            x_val(i) = a+(i-1)*h
            f_val(i) = f(x_val(i))
        end do

        ! sum up
        trapezoid = -0.5*h*(f_val(1)+f_val(n))
        do i=1,n
            trapezoid=trapezoid+h*f_val(i)
        end do
    end function trapezoid

    subroutine error_table(f,a,b,nvals,int_true)
        implicit none
        ! print error tables for trapezoidal method 
        ! for different number of evaluation points
        ! Arguments:
        !   f, a, b:    same meanings as in function 'trapezoid'
        !   nvals:      different number of evaluation points to try
        !   int_true:   true value of the integration, normally you don't have

        real(kind=8), intent(in):: a,b,int_true
        real(kind=8), external:: f
        integer, dimension(:), intent(in) :: nvals
        ! Local variables
        real(kind=8) :: last_error=0.d0, int_trap, error, ratio
        integer :: i

        print *, "    n         trapezoid            error       ratio"
        do i=1,size(nvals)
            int_trap = trapezoid(f,a,b,nvals(i))
            error = dabs(int_trap-int_true)
            ratio = last_error/error
            last_error = error
            print 11, nvals(i), int_trap, error, ratio
            11     format(i8, es22.14, es13.3, es13.3)
        end do
    end subroutine error_table
end module quadrature

