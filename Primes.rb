primes=[]

# Initialize variables

primes=[]
primes.push(2)
count = 1
n=3

# Change the 1000 to how many primes you want to generate
while (count < 10000) do 
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
puts( "Saving testfile.data with #{primes.length} primes.")

f= File.new("testfile.data","w")
f.write("#{primes.length}\n")
primes.each do |i|
  f.write("#{i}\n")
end
f.close()