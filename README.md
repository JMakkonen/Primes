# Primes
Ruby Prime Calculation

### Overview
This program was an exercise for programming in Ruby.  There are two parts.  The first is Primes.r which creates a file that contains a set number of primes.  The program now asks the user how many primes to generate.  This goes into the testfile.data with the first entry in the file being the number of primes in the file.

The second part is the CheckPrime.r program.  It first reads in the data file generated by Primes.r.  The first entry in the data file is the number of primes the file holds.  If there was an "while (!EOF)" structure...
Anyway, the program then asks for a number and then proceeds to check if it is prime.  Again, I added a basic check on the max size, but need to add some more user input validations... nothing less than 2, and it has to be an integer.
Can you round a floating point variable in Ruby by x = x.to_i.to_f ?
