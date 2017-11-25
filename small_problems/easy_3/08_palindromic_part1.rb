def palindrome? str
  str == str.reverse
end

puts palindrome?('madam') # == true
puts palindrome?('Madam') # == false          # (case matters)
puts palindrome?("madam i'm adam") # == false # (all characters matter)
puts palindrome?('356653') # == true

# Further Exploration

# The #reverse method is defined for both arrays and strings. hence the above
# method is also valid with arrays as well as strings.
puts
puts palindrome?([1, 2, 3, 2, 1]) # == true
puts palindrome?([1, 2, 3]) # == false
