# Write a method that takes one argument, a positive integer, and 
# returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'


# Answer

def stringy num
    str = '10' * (num / 2) + '1' * (num % 2)
end

puts stringy(6) # == '101010'
puts stringy(9) # == '101010101'
puts stringy(4) # == '1010'
puts stringy(7) # == '1010101'

# =====================================

# Write a method named include? that takes an Array and a search value as 
# arguments. This method should return true if the search value is in the array, 
# false if it is not. You may not use the Array#include? method in your solution.

# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false

def include?(arr, val)
    bool = false
    arr.each {|elm| bool = true if elm == val}
    bool
end

puts 
puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

#======================================================
puts 

# Write a method that takes a single String argument and returns a new string that 
# contains the original value of the argument, but the first letter of every word 
# is now capitalized.

# You may assume that words are any sequence of non-blank characters, 
# and that only the first character of each word must be considered.

# Examples

# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# logic: break sentence to words array
# capitalize every word
# join the new words

def word_cap(str)
    str_arr = str.split(' ')
    str_arr.map! {|word| word.capitalize }
    str_arr.join(' ')
end


puts word_cap('four score and seven') # == 'Four Score And Seven'
puts word_cap('the javaScript language') # == 'The Javascript Language'
puts word_cap('this is a "quoted" word') # == 'This Is A "quoted" Word'

#======================================================
puts 

# Write a method that takes an array of strings, and returns an array of 
# the same string values, except with the vowels (a, e, i, o, u) removed.
