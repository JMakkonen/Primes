# P1063: plotting the evolution of a limit

''' Adapted from preface to Dr. Euler's Fabulous Formula by Paul J. Nahin
The preface included some matlab code which has been converted into python below.
'''

import math, pylab
n_arr = [2,3,4,5,10,20,50,100]
for n1 in range(len(n_arr)):
    n = n_arr[n1]
    c = 1+(1j*math.pi)/n
    w = []
    w.append(c)
    for k in range(n):
        w.append(w[k]*c)
    x = []
    y = []
    for k in range(n):
        x.append(w[k].real)
        y.append(w[k].imag)
    pylab.subplot(3,3,n1+1)
    pylab.plot(x,y)
    # pylab.axis([-1.5,1.5,-0.5,1.5])
pylab.show()
