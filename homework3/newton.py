# for homework3 problem 3
# By Ryan (Weiran) Zhao
# Thu,May 30th 2013 10:39:30 AM EDT

def solve(fvals, x0, debug=False):
    """
    Solve f(x)=0 using newton's method;
    fvals:  is a tuple of (f(x), f'(x))
    x0:     is starting point for newton's method
    debug:  print debug information
    """
    
    maxiter = 20    # max iteration
    tol = 1e-14     # tolerance

    if(debug):
        print "Initial guess: x =  %22.15e" %x0
    f,fp = fvals(x0)
    if(abs(f)<tol):
        return (x0, 0)
    for i in range(maxiter):
        x0 = x0 - f/fp
        print "After %i iterations, x= %22.15e" % (i+1, x0)
        f,fp = fvals(x0)
        if(abs(f)<tol):
            break;

    if(i==maxiter-1):
        (f,fp) = fvals(x0)
        if(abs(f)>tol):
            print "*** Warning: might not converging"
    
    return x0, i+1


def fvals_sqrt(x):
    """
    Return f(x) and f'(x) for applying Newton to find a square root.
    """
    f = x**2 - 4.
    fp = 2.*x
    return f, fp

def test1(debug_solve=False):
    """
    Test Newton iteration for the square root with different initial
    conditions.
    """
    from numpy import sqrt
    for x0 in [1., 2., 100.]:
        print " "  # blank line
        x,iters = solve(fvals_sqrt, x0, debug=debug_solve)
        print "solve returns x = %22.15e after %i iterations " % (x,iters)
        fx,fpx = fvals_sqrt(x)
        print "the value of f(x) is %22.15e" % fx
        assert abs(x-2.) < 1e-14, "*** Unexpected result: x = %22.15e"  % x
