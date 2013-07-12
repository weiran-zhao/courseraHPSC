! Modified from test.f90
! By Ryan (Weiran) Zhao 
! Thu,Jul 11th 2013 09:59:15 PM EDT
program test

    use mpi

    use quadrature, only: trapezoid
    use functions, only: f, fevals_proc, k

    implicit none
    real(kind=8) :: a,b,int_true, int_approx, int_sub, stepsize, sub_ab(2)

    integer :: proc_num, num_procs, ierr, n, fevals_total, j
    integer, dimension(MPI_STATUS_SIZE) :: status

    call MPI_INIT(ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, num_procs, ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD, proc_num, ierr)

    ! All processes set these values so we don't have to broadcast:
    k = 1.d3   ! functions module variable 
    a = 0.d0
    b = 2.d0
    int_true = (b-a) + (b**4 - a**4) / 4.d0 - (1.d0/k) * (cos(k*b) - cos(k*a))
    n = 1000

    ! Each process keeps track of number of fevals:
    fevals_proc = 0

    if (proc_num==0) then
        print '("Using ",i3," processes")', num_procs
        print '("true integral: ", es22.14)', int_true
        print *, " "  ! blank line
        ! master process chops up the work into num_procs-1 pieces
        stepsize = (b-a)/(num_procs-1)
        do j = 1, num_procs-1
            sub_ab(1) = a+(j-1)*stepsize
            sub_ab(2) = a+j*stepsize
            call MPI_SEND(sub_ab, 2, MPI_DOUBLE_PRECISION, j, 222, &
                          MPI_COMM_WORLD, ierr)
        end do
        int_approx=0.d0
        do j =1, num_procs-1
            call MPI_RECV(int_sub,1,MPI_DOUBLE_PRECISION,MPI_ANY_SOURCE,333, &
                          MPI_COMM_WORLD,status, ierr)
            int_approx = int_approx+int_sub
        end do
    endif

    if (proc_num/=0) then
        call MPI_RECV(sub_ab, 2, MPI_DOUBLE_PRECISION, 0, 222, &
                      MPI_COMM_WORLD, status, ierr)
        int_sub = trapezoid(f,sub_ab(1),sub_ab(2),n)
        call MPI_SEND(int_sub, 1, MPI_DOUBLE_PRECISION, 0, 333, & 
                      MPI_COMM_WORLD, ierr)
    end if

    ! print the number of function evaluations by each thread:
    print '("fevals by Process ",i2,": ",i13)',  proc_num, fevals_proc

    call MPI_BARRIER(MPI_COMM_WORLD,ierr) 

    call MPI_REDUCE(fevals_proc, fevals_total, 1, MPI_INTEGER, MPI_SUM, 0, &
                    MPI_COMM_WORLD, ierr)
    call MPI_BARRIER(MPI_COMM_WORLD,ierr) 

    if (proc_num==0) then
           print '("Trapezoid approximation with ",i8," total points: ",es22.14)',&
            (num_procs-1)*n, int_approx
    print '("Total number of fevals: ",i10)', fevals_total
    end if

    call MPI_FINALIZE(ierr)

end program test
