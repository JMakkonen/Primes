# Program P1005.rb used to test the functions defined in P1005.rb.
$LOAD_PATH << "."
require "P1004.rb"

primes = ReadPrimes()
puts("#{primes.length()} primes read in. Up to #{primes[primes.length()-1]}")
puts("Please enter the number you want to factor")
number = gets().chomp.to_f
factors = Factor(number, primes)
puts("#{number} factors to #{factors}")  #There’s some output function that works better.