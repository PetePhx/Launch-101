def multiply(num_1, num_2)
  num_1 * num_2
  rescue
  puts "incorrect input."
end

puts multiply(3, 5)

puts multiply("hi", "okay")

# if we use an array as the first parameter, the output will be an array
# consisting of the repeated elements of the original array

p multiply([1,2], 3) # => [1, 2, 1, 2, 1, 2]
