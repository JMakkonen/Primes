# This program calculates a number of Fibonacci sequence numbers and stores them in a file.

# Initialize variables
fib_seq=[]
fib_seq.push(0) # First term of sequence
fib_seq.push(1) # Second term of sequence
count = 2

# Ask user how many sequence terms to generate.
puts("Please enter how many terms of the Fibonacci Sequence to generate")
lim = gets().chomp.to_i
if (lim <10 || lim>10**9) then
  lim = 10
end

# This loop generates the sequence terms
while (count < lim) do 
  count = count +1
  fib_seq.push(fib_seq[count-3]+fib_seq[count-2])
end

# This section saves the terms to a file.
puts( "Saving Fib_seq.data with #{fib_seq.length} terms.")

f= File.new("Fib_seq.data","w")
f.write("#{fib_seq.length}\n")
fib_seq.each do |i|
  f.write("#{i}\n")
end
f.close()
puts( "File saved.")