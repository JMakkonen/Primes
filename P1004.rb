
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

def lcm(num1, num2)
primes = ReadPrimes()
fac1 = Factor(num1, primes)
fac2 = Factor(num2, primes)

lcm_fac = [] # We will be storing factors into this array
while fac1.length() !=0 do
  pos2 = -1
  for i in (0..fac2.length()-1)
    if fac2[i] == fac1[0] then
      pos2 = i
    end
  end
  if pos2 != -1 then
    fac2.delete_at(pos2)
  end
  lcm_fac.push(fac1[0])
  fac1.delete_at(0)
end
while fac2.length() !=0 do
  lcm_fac.push(fac2[0])
  fac2.delete_at(0)
end
# Multiply all the factors together to get the LCM.
lcm = 1
for i in (0..lcm_fac.length()-1) do
  lcm = lcm * lcm_fac[i]
end
return lcm
end