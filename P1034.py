# P1034.  Builing a large list of primes

import os

def initial_build(N):
    # N is the number of primes to generate
    output = [2]
    current = 3
    i=1
    while i < N:
        is_prime = True
        for x in output:
            if current % x == 0:
                is_prime = False
            if x * x > current:
                break
        if is_prime:
            output.append(current)
            i += 1
        current += 2
    return output

def save_primes(pl, filename):
    print('saving ',len(pl), " primes")
    f = open(filename, 'w', encoding='utf-8')
    for x in pl:
        f.write(str(x) + '\n')
    f.close()

def load_primes(filename):
    pl = []
    f = open(filename, 'r', encoding = 'utf-8')
    for line in f:
        pl.append(int(line))
    f.close()
    print(len(pl), " primes loaded.")
    return pl

def check_prime_f(n,filename):
    # n is the number to check
    # filename is a file of prime numbers
    # returns a boolean
    pl = load_primes(filename)
    is_prime = True
    if not( x in pl):
        i = 0
        while (i < len(pl)) and pl[i] * pl[i] < n:
            if n % pl[i] == 0:
                is_prime == False
                break
            i += 1
    return is_prime

def check_prime_l(n, pl):
    # n is the number to check
    # pl is a list of prime numbers
    # returns a boolean
    is_prime = True
    if not( n in pl):
        i = 0
        while (i < len(pl)) and (pl[i] * pl[i] < n):
            if n % pl[i] == 0:
                is_prime == False
                break
            i += 1
    return is_prime

def factor(n,pl):
    output = []
    #if check_prime_l(n,pl):
    #    output.append(n)
    #else:
    i = 0
    m = n
    while (i < len(pl)) and m != 1:
        if m % pl[i] == 0:
            output.append(pl[i])
            m = m / pl[i]
        else:
            i += 1
    return output

if __name__ == "__main__":
    # This is so that it does not execute the code below
    # if the file is imported as a module.
    filename = 'primes0.data'
    if os.path.isfile(filename):
    # do stuff
        pl = load_primes(filename)
    else:
    # do initialization
        print('initializing 5000 primes')
        pl = initial_build(5000)
        save_primes(pl, filename)

    for y in range(10):
        print('calculating next 10000 primes')
        i = 0
        current = pl[-1] +2
        while i < 10000:
            is_prime = True
            for x in pl:
                if current % x == 0:
                    is_prime = False
                if x * x > current:
                    break
            if is_prime:
                pl.append(current)
                i += 1
            current += 2

    # print(__name__, " in P1034")

    # now save
        save_primes(pl, filename)
        print('largest prime ',pl[-1])
