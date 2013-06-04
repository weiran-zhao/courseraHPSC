! Written by Ryan (Weiran) Zhao , Computer Science Dept, IU Bloomington
! Mon,Jun 03th 2013 08:53:05 PM EDT
program test_quartic

    use newton, only: solve, tol
    use functions, only: eps, f_quartic, fprime_quartic 

    real(kind=8), dimension(3) :: tol_seq, eps_seq
    integer :: tol_idx, eps_idx
    real(kind=8) :: x0, fx, x_star
    logical :: debug
    ! store return value
    real(kind=8) :: x
    integer :: iters

    !^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ! Give initial values
    !^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    x0 = 4.d0
    debug = .false.
    tol_seq = (/1.d-5, 1.d-10, 1.d-14/)
    eps_seq = (/1.d-4, 1.d-8, 1.d-12/)
    

    print 51, x0
51  format('Starting with initial guess ', es23.15)

    print *, '    epsilon        tol    iters          x                 f(x)        x-xstar'
    print *, ' '
    eps_loop: do eps_idx = 1, 3
        eps = eps_seq(eps_idx)
        tol_loop: do tol_idx = 1,3
            tol = tol_seq(tol_idx)
            call solve(f_quartic, fprime_quartic, x0, x, iters, debug)
            fx = f_quartic(x)
            x_star = 1. + eps**(1/4.)
            print 52, eps, tol, iters, x, fx, x-x_star
            52 format(2es13.3, i4, es24.15, 2es13.3)
        end do tol_loop
        print *, ' '
    end do eps_loop

end program test_quartic
