
! program for solving intersection problem of homework3 
! Written by Weiran (Ryan) Zhao

program intersections

    use newton, only: solve
    use functions, only: g_intersection, gp_intersection

    implicit none
    real(kind=8) :: x, fx
    real(kind=8) :: x0vals(4)
    integer :: iters, idx 
	logical :: debug         ! set to .true. or .false.

    debug = .false.

    ! values to test as x0:
    x0vals = (/-2.2d0, -1.5d0, -.6d0, 1.5d0 /)

    do idx=1,4    
        print 51, x0vals(idx)
51      format('With initial guess x0 = ', es22.15)
        call solve(g_intersection, gp_intersection, x0vals(idx), x, iters, debug)

        print 52, x, iters
52      format('solver returns x = ', es22.15, ' after', i3, ' iterations')
    end do 

end program intersections
