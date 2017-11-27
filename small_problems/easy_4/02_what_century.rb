# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.

def century(num)
  cen = (num - 1) / 100 + 1
  suf = ''
  if cen % 100 == 11
    suf = 'th'
  elsif cen % 100 == 12
    suf = 'th'
  elsif cen % 100 == 13
    suf = 'th'
  elsif cen % 10 == 1
    suf = 'st'
  elsif cen % 10 == 2
    suf = 'nd'
  elsif cen % 10 == 3
    suf = 'rd'
  else
    suf = 'th'
  end

  cen.to_s + suf
end

puts century(2000) # == '20th'
puts century(2001) # == '21st'
puts century(1965) # == '20th'
puts century(256)  # == '3rd'
puts century(5)    # == '1st'
puts century(10103) # == '102nd'
puts century(1052)  # == '11th'
puts century(1127)  # == '12th'
puts century(11201) # == '113th'
