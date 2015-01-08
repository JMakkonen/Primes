# This program will check a number entered by the user
# to see if it is prime.  It relies on a file with primes
# and checks if each prime divides the number given evenly.

f = File.open("testfile.data","r")
primes = []
count = 0
# First entry in the file is the number of primes it holds
num = f.readline().to_f
# Now read all the primes into an array.
while (count < num) do
  primes.push(f.readline().to_f)
  count = count +1
end
f.close()
puts("#{primes.length()} primes read in. Up to #{primes[primes.length()-1]}")


# Now get input from user
number = gets().chomp.to_f

# Now check by dividing the number by all the primes.
# Only need to check up to the square root!
# This first part validates user input.  Needs some more work
if (primes[num-1] * primes[num-1] < number) then
  puts("Your number is too large")
else
  count = 0
  isPrime = true
  flag = true
  while (flag) do
    if (number % primes[count] == 0) then
      puts ("Your number is divisable by #{primes[count]}")
      isPrime = false
    end
    if (primes[count]**2 > number) then
      flag = false
    else
      count = count +1
    end
  end
  if (isPrime) then
    puts("Looks like your number is prime!")
  end
end