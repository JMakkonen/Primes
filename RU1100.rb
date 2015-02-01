# RU1000 for implementing Rot-N Cypher
# Call rotn(msg,shift) where msg is the message string
# and shift, defaulted to 13, is the offset.
# Using the default 13 shift results in a situation where
# successive calls just toggle between the clear and cypher text.
# Other shifts are possible.  Just you have to have them add up to 
# 26.  The code will accept negative shifts but will not process
# it correctly.

def rotn(s, n=13)  #default Rot-13 but can be changed.
  out = ""
  s.each_codepoint {
	|c|
    if c > 64 and c < 91 then
	  c = c+n
	  if c >90 then
	    c = c-26
	  end
	elsif c> 96 and c< 123 then
      c = c +n
      if c > 122 then
        c = c-26
      end
    end
    out.concat(c)	
  }
  return out
end

# Examples of use

msg = "My message"
msg = rotn(msg)
puts(msg)  # shows encrypted msg
msg = rotn(msg)
puts(msg)  # shows unenctypted msg

msg = "Second message"
shift = 5 # custom shift, 26-shift will be unencryption shift 

msg = rotn(msg, shift)
puts(msg)  # shows encrypted msg

msg = rotn(msg, 26-shift)  
puts(msg)  # shows unencrypted msg