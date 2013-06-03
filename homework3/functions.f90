! $UWHPSC/codes/fortran/newton/functions.f90

module functions

    implicit none
    real(kind=8), parameter :: pi = acos(-1.e0)
contains

real(kind=8) function f_sqrt(x)
    implicit none
    real(kind=8), intent(in) :: x

    f_sqrt = x**2 - 4.d0

end function f_sqrt


real(kind=8) function fprime_sqrt(x)
    implicit none
    real(kind=8), intent(in) :: x
    
    fprime_sqrt = 2.d0 * x

end function fprime_sqrt

real(kind=8) function g_intersection(x)
    implicit none
    real(kind=8), intent(in) :: x

    g_intersection = x*dcos(pi*x)-(1-.6*x**2)

end function g_intersection

real(kind=8) function gp_intersection(x)
    implicit none
    real(kind=8), intent(in) :: x

    gp_intersection = dcos(pi*x) -x*dsin(pi*x)*pi + 1.2*x
end function gp_intersection


end module functions
