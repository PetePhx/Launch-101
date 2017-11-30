# Multiplicative Average

# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

def show_multiplicative_average(arr)
  average = arr.reduce(:*).to_f / arr.size
  puts "THe result is #{format('%.03f', average)}"
end

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

# Further Exploration

# What happens if you omit the call to #to_f on the first line of our method?

# The integer division would result in the wrong value for the Multiplicative
# average.
