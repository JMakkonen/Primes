# This program is to generate Farey Series of order n
# Farey series of order n are all the fractions (0 <= 1)
# that can be made using the integers 1...n

farey=Array.new()

# ask what order Farey Series to create
puts("Enter what order of Farey series to create")
num = gets().chomp.to_i
if num < 2 then
  num = 2
end
# The code below generates the Farey series within the 
# farey array.
for i in (1..num)
  for j in (0..i)
    if farey.length() > 1 then
      flag = true  # To eliminate duplicates such as 2/4 == 1/2
	  for k in (0..farey.length()-1)
	    if (j.to_f/i.to_f == farey[k][0]) then
		  flag = false
		end
	  end
	  if flag then
	    a = Array[j.to_f/i.to_f,j,i]
		farey.push(a)
	  end
	else
	  a = Array[j.to_f/i.to_f,j,i]
	  farey.push(a)
	end
  end
end

farey.sort! # Surprisingly this works well.

for i in 0..farey.length()-1
  puts("Entry #{i} is #{farey[i][1]}/#{farey[i][2]} which is decimal #{farey[i][0]}")
  end

# So at this point you have an array which has both fractional
# and decimal representations of the entries in the Farey
# series as entered at the prompt.  Go nuts...