# Swap Case

# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(str)
  res_arr = []
  str.chars.each do |chr|
    res_arr << case chr
               when ('a'..'z')
                 chr.upcase
               when ('A'..'Z')
                 chr.downcase
               else
                 chr
               end
  end
  res_arr.join('')
end

p [
  swapcase('CamelCase') == 'cAMELcASE',
  swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
]
