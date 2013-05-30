"""
Problem 4 of homework 3
By Ryan (Weiran) Zhao
Thu,May 30th 2013 10:41:20 AM EDT
"""

def fvals(x):
    """
    function take x as input and return
    g(x) = x cos(pi x) -(1-.6 x^2)
    g'(x) = cos(pi x) - x sin(pi x) pi + 1.2 x
    """

    from numpy import cos,pi,sin
    g = x*cos(pi*x)-(1-.6*x**2)
    gp = cos(pi*x) -x*sin(pi*x)*pi + 1.2*x
    return g,gp

if __name__=="__main__":

    """
    use four initial guess to solve the problem and then
    plot the figure as required
    """

    from newton import solve
    import matplotlib.pyplot as plt
    import numpy as np

    # initial guess by eyeballs
    guess = (-2.2, -1.5, -0.6, 1.5)
    x = np.ones(4)

    for i in range(4):
        print "\n*********************************************"
        x[i], iters = solve(fvals,guess[i],False)
        print "With initial guess x0 = %22.15e" %i
        print "solve returns x = %22.15e after %i iterations" %(x[i], iters)

    # plot figure
    xvals = np.linspace(-5,5,1000)
    g1 = xvals*np.cos(np.pi*xvals)
    g2 = 1-.6*xvals**2
    # for intersection point
    fx = x*np.cos(np.pi*x)

    plt.figure(1)       # open plot figure window
    plt.clf()           # clear figure
    plt.plot(xvals,g1)  # connect points with a blue line
    plt.plot(xvals,g2)
    plt.plot(x,fx,'ko') # highlight intersection with black dots
    plt.legend(('g1', 'g2'))

    plt.title('intersection of function g1 and g2')
    
    plt.savefig('intersections.png')   # save figure as .png file

    
