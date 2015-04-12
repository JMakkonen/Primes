# Primes
Ruby Prime Calculation and other math tools

### Overview
This program was an exercise for programming in Ruby.  Some programs were inspired by a text on number theory.

### Fibonacci sequence number generator

I have added to this repo a program that asks the users how many terms of the Fibonacci sequence to generate and then saves them into a file called Fib_seq.data.

The Fibonacci sequence is defined as:
* a_0 = 0
* a_1 = 1
* a_n = a_n-1 + a_n-2 for n>1

Look it up on wikipedia if you want more info.

### Program P1002
This program was written to test the accuracy and limits of Binet's formula which is a direct calculation of the n-th term of the sequence.  There are some comments added to the end of the program discussing where the limits of the arithmatic engine in Ruby lie.

### Program P1003
This program was written to create an array with the Farey series of order N as entered at the prompt.  At the end of the program you have an array, where each entry in the array gives you at element [x][0], the decimal representation of the term in the Farey series, at element [x][1], the numerator and at element [x][2], the denominator of the term in the Farey series.  In Hardy's and Wright's *An introduction to the theory of numbers*, in section 3.4, theres a brief explanation of how to find the next term in a Farey series of order n.  Unfortunately, this seemed to be way too difficult in comparison with the brute force method employed in the program.

### Program P1004
This program has 4 functions defined in it.  There is a function that creates a file with prime numbers (as many as specified by the call).  These are stored in a file called testdata.file.  ReadFile reads and returns an array of prime numbers which are saved in testfile.data.  The Factor function accepts a number and the array of primes and returns an array of the prime factors of the number.  If the number is divisable multiple times by a prime factor, it will repeat it.  So for example, calling Factor(16, [2,3,5,7]) will return an array [2.0,2.0,2.0,2.0]  since 16 is 2 to the power of 4.
The 3rd function defined is lcm(num1, num2) and returns the lowest (or least) common multiple of num1 and num2.  It uses the Factor function to do this.
The 4th function is gcf(num1, num2) and returns the greatest common factor between num1 and num2.  It also uses the Factor function to do this.

### Program RU1100
This program implements a Rot-N message encryption.  It has a function rotn(message, offset).  Offset is defaulted to 13.  So rotn("my message") will do a rot-13 transform on the string.

### Program RU1104
This program uses P1004 (above) and provides a window for the user to enter a number and then factors that number.  It uses the TCL TK windows wrapper to the OS API, so you have to have that loaded.

### Program P1034
Just to note I have switched to programming in Python rather than Ruby mostly because the courses I am taking on Coursera require Python programming.  Anyway, I am retracing some of the work done above in Ruby and re-doing it in Python.
I have, in this program, created a number of functions related to prime numbers.  It will check if numbers are prime, it will factor numbers.  The program if run, will calculate and append 100,000 primes into a file primes0.data.  My primes0.data file has about 1,000,000 primes in it, it is 9.4 MB in size.  The computer can load the whole thing into memory without an issue.  I'll update this comment when/if I build it up to 10,000,000 primes.

### Program P1035
This program produces a graph of the distribution of the number of factors of a number between 10,000 and 100,000.  (It does take some time to run.)  It is surprising how large a percentage of the numbers have 1,2 or 3 prime factors.

### Program P1063
This creates a series of graphs on the evolution of lim (1 + i*pi/n)^n as n-> infinity.  It is based on matlab code published in the preface to Dr. Euler's Fabulous Formula by Paul J. Nahim and adapted to Python.