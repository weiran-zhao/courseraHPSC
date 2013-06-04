! Originally in $UWHPSC/codes/fortran/newton/functions.f90
! Modified by Ryan (Weiran) Zhao to question 7 of homework 3
! Mon,Jun 03th 2013 08:30:02 PM EDT

module functions

    implicit none

    ! eps can be decided by user
    real(kind=8), save :: eps

contains

real(kind=8) function f_quartic(x)
    implicit none
    real(kind=8), intent(in) :: x

    f_quartic = (x-1.)**4 - eps
end function f_quartic

real(kind=8) function fprime_quartic(x)
    implicit none
    real(kind=8), intent(in) :: x

    fprime_quartic = 4. * (x-1.)**3
end function fprime_quartic


end module functions
