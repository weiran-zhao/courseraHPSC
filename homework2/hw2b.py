
"""
Demonstration module for quadratic interpolation.
Mainly for compute the coeffcients of quardratic polynomial give three sets of
data; will also do testing and have a main function
Also add a function for plotting

*********************************************
Answer for question 5: because matrix A 
becomes singular, when xi=[1.1.2]
*********************************************
Modified by: ** Ryan (Weiran) Zhao**
"""


import numpy as np
import matplotlib.pyplot as plt
from numpy.linalg import solve

def quad_interp(xi,yi):
    """
    Quadratic interpolation.  Compute the coefficients of the polynomial
    interpolating the points (xi[i],yi[i]) for i = 0,1,2.
    Returns c, an array containing the coefficients of
      p(x) = c[0] + c[1]*x + c[2]*x**2.

    """

    # check inputs and print error message if not valid:

    error_message = "xi and yi should have type numpy.ndarray"
    assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message

    error_message = "xi and yi should have length 3"
    assert len(xi)==3 and len(yi)==3, error_message

    # Set up linear system to interpolate through data points:
    A = np.array([np.ones(3),xi,xi*xi]).T
    b = yi
    
    # Solve the system:
    c = solve(A,b)

    return c
def plot_quad(xi,yi):
    """
    takes two numpy arrays xi and yi of length 3, calls quad_interp to compute 
    c, and then plots both the interpolating polynomial and the data points, 
    and saves the resulting figure as quadratic.png
    """

    x = np.linspace(xi.min()-1,xi.max()+1,1001) # points to evaluate polynomial
    c = quad_interp(xi,yi)  #calculate c
    y = c[0] + c[1]*x + c[2]*x**2
    
    plt.figure(1)       # open plot figure window
    plt.clf()           # clear figure
    plt.plot(x,y,'b-')  # connect points with a blue line
    
    # Add data points  (polynomial should go through these points!)
    plt.plot(xi,yi,'ro')   # plot as red circles
    plt.ylim(yi.min()-1,yi.max()+1)         # set limits in y for plot
    
    plt.title("Data points and interpolating polynomial for quardratic " \
              "polynomials")
    
    plt.savefig('quadratic.png')   # save figure as .png file

def test_quad1():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([-1.,  0.,  2.])
    yi = np.array([ 1., -1.,  7.])
    c = quad_interp(xi,yi)
    c_true = np.array([-1.,  0.,  2.])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)

def test_quad2():
    """
    Test code, with various xi and yi, generated using random number
    """
    testNumber=10000;
    scale = 100;
    for i in range(testNumber):
        xi = np.random.rand(3)*scale-scale
        c_true = np.random.rand(3)-.5
        A = np.array([np.ones(3),xi,xi*xi]).T
        yi = np.dot(A,c_true)
        c = quad_interp(xi,yi)
        assert np.allclose(c,c_true), \
                "Incorrect result, c  = %s, Expected: c = %s" % (c,c_true)
        
if __name__=="__main__":
    # "main program"
    # the code below is executed only if the module is executed at the command line,
    #    $ python demo2.py
    # or run from within Python, e.g. in IPython with
    #    In[ ]:  run demo2
    # not if the module is imported.
    print "Running test..."
    test_quad1()

"""
------------------------------------------------------------------------------
dealing with cubic interpolation
------------------------------------------------------------------------------
"""

def cubic_interp(xi,yi):
    """
    Cubic interpolation.  Compute the coefficients of the polynomial
    interpolating the points (xi[i],yi[i]) for i = 0,1,2,3.
    Returns c, an array containing the coefficients of
      p(x) = c[0] + c[1]*x + c[2]*x**2 + c[3]*x**3.

    """

    # check inputs and print error message if not valid:

    error_message = "xi and yi should have type numpy.ndarray"
    assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message

    error_message = "xi and yi should have length 4"
    assert len(xi)==4 and len(yi)==4, error_message

    # Set up linear system to interpolate through data points:
    A = np.array([np.ones(4),xi,xi*xi,xi*xi*xi]).T
    b = yi
    
    # Solve the system:
    c = solve(A,b)

    return c
def plot_cubic(xi,yi):
    """
    takes two numpy arrays xi and yi of length 4, calls cubic_interp to compute 
    c, and then plots both the interpolating polynomial and the data points, 
    and saves the resulting figure as cubic.png
    """

    x = np.linspace(xi.min()-1,xi.max()+1,1001) # points to evaluate polynomial
    c = quad_interp(xi,yi)  #calculate c
    y = c[0] + c[1]*x + c[2]*x**2 + c[3]*x**3
    
    plt.figure(1)       # open plot figure window
    plt.clf()           # clear figure
    plt.plot(x,y,'b-')  # connect points with a blue line
    
    # Add data points  (polynomial should go through these points!)
    plt.plot(xi,yi,'ro')   # plot as red circles
    plt.ylim(yi.min()-1,yi.max()+1)         # set limits in y for plot
    
    plt.title("Data points and interpolating polynomial for quardratic " \
              "polynomials")
    
    plt.savefig('cubic.png')   # save figure as .png file

def test_cubic1():
    """
    Test code, no return value or exception if test runs properly.
    """
    testNumber=10;
    scale = 100;
    for i in range(testNumber):
        xi = np.random.rand(4)*scale-scale
        c_true = np.random.rand(4)-.5
        A = np.array([np.ones(4),xi,xi*xi,xi*xi*xi]).T
        yi = np.dot(A,c_true)
        c = cubic_interp(xi,yi)
        assert np.allclose(c,c_true), \
                "Incorrect result, c  = %s, Expected: c = %s" % (c,c_true)
