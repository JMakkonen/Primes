
# This program defines a number of functions for
# number theory purposes.  
# makeFile(x) makes a file of x number of primes.
# ReadPrimes() reads a file of primes
# Factor(x, p) factors the number x using a list of primes in p.
# lcm(x, y) returns the lowest common denominator between x and y
# gcf(x, y) returns the greatest common factors between x and y
# checkPrime(x) returns whether x is prime (true or false) 
# checkFib (x) returns whether x is a Fibonacci number (true or false)

include Math

def makeFile(x)
  primes=[]
  primes.push(2)
  count = 1
  n=3
  if x < 10 then
    x = 10
  end
  while (count < x) do 
    flagIt = false # Set flag that number is prime.
# The following loop could be sped up by checking only up
# to sqrt of n.  Would a break work?
    primes.each do |i|
      if (n % i == 0) then 
        flagIt = true # number is not prime, then clear flag
      end
    end
    if flagIt == false then
      primes.push(n) # Hey it was prime, add it to the array
      count = count + 1
    end
    n=n+2  # Check the next number.
  end
  f= File.new("testfile.data","w")
  f.write("#{primes.length}\n")
  primes.each do |i|
    f.write("#{i}\n")
  end
  f.close()
end

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

def gcf(num1, num2)
  primes = ReadPrimes()
  fac1 = Factor(num1, primes)
  fac2 = Factor(num2, primes)
  gcm_fac = []
  while fac1.length() !=0 do
    pos2 = -1
    for i in (0..fac2.length()-1)
      if fac2[i] == fac1[0] then
        pos2 = i
      end
    end
    if pos2 != -1 then
      gcm_fac.push(fac2[pos2])
	  fac2.delete_at(pos2)
    end
    fac1.delete_at(0)
  end
  gcm = 1
  if gcm_fac.length() > 0 then
    for i in (0..gcm_fac.length()-1) do
      gcm = gcm * gcm_fac[i]
    end
  end
  return gcm
end

def checkPrime(num)
  primes = ReadPrimes()
  flag = true
  ind = 0
  if num > 2 and num < primes.last ** 2 then
    while !(primes[ind] > sqrt(num)) do
	  if num % primes[ind] == 0 then
	    flag = false
	  end
	  ind = ind + 1
	end
  end
  return flag
end

def checkFib(num)
  a = 5*num*num + 4
  b = a-8 # 5*num*num - 4
  if (sqrt(a) ** 2).to_i == (sqrt(a).to_i ** 2) or (sqrt(b) ** 2).to_i == (sqrt(b).to_i ** 2) then
    return true
  else
    return false
  end
end