# P1035.  Test if anumber is prime.

from P1034 import load_primes, factor
import pylab

pl = load_primes('primes0.data')

result = dict()

for x in range (10000,100000):
    p = factor(x, pl)
    if len(p) in result:
        result[len(p)] += 1
    else:
        result[len(p)] = 1

xs = [ i for i in result ]
ys = [result[xs[i]] for i in range(len(result))]
pylab.plot(xs,ys)
pylab.show()
