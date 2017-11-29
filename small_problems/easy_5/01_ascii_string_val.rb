# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

def ascii_value str
  str.chars.reduce(0) {|total, char| total + char.ord }
end

p [ascii_value('Four score') == 984,
ascii_value('Launch School') == 1251,
ascii_value('a') == 97,
ascii_value('') == 0 ]

# Further Exploration:

# The method Integer#chr is the complement of String#ord:
# this works for single-character strings:

puts 'h'.ord.chr == 'h' #true
