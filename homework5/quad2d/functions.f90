
module functions

    use omp_lib
    implicit none
    integer :: fevals(0:7)
    integer :: gevals(0:7)
    save

contains

    real(kind=8) function g(x,y) 
        implicit none
        real(kind=8), intent(in) :: x, y
        integer thread_num

        ! keep track of number of function evaluations by each thread
        thread_num = 0
        !$ thread_num = omp_get_thread_num()
        gevals(thread_num) = gevals(thread_num) +1

        g = sin(x+y)
    end function g

    real(kind=8) function f(x)
        implicit none
        real(kind=8), intent(in) :: x 
        integer thread_num
        ! Local variables:
        integer :: i, ny = 1000
        real(kind=8) :: a=1.d0, b=4.d0, h, trap_sum

        ! keep track of number of function evaluations by
        ! each thread:
        thread_num = 0   ! serial mode
        !$ thread_num = omp_get_thread_num()
        fevals(thread_num) = fevals(thread_num) + 1
        

        h = (b-a)/(ny-1)
        trap_sum = 0.5d0*(g(x,a) + g(x,b))  ! endpoint contributions
        do i=2,ny-1
            trap_sum = trap_sum + g(x,a+(i-1)*h)
        enddo

        f = h * trap_sum

    end function f

end module functions
