
# This program defines two functions so that numbers can be factored using
# these two functions.

def ReadPrimes()
f=File.open("testfile.data","r")
primes = []
count = 0
num = f.readline().to_f
while (count < num) do
  primes.push(f.readline().to_f)
  count = count +1
end
f.close()
return primes
end

def Factor(number, primes)
if (number >= 2 and number < primes[primes.length()-1]**2) then
  count1 = 0
  factors = []
  while (number.to_i != 1 and count1 < primes.length()) do
    if (number % primes[count1] == 0) then
      factors.push(primes[count1])
      number = number/primes[count1]
    else
      count1 = count1 +1
    end
  end
  return factors
else
  return nil
end
end

