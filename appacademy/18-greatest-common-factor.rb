# Write a method that takes in two numbers. Return the greatest
# integer that evenly divides both numbers. You may wish to use the
# `%` modulo operation.
#
# Difficulty: medium.

=begin
- input: 2 integers
- ouput: integer. GCD of the two numbers
- algorithm:
  - initialize divisor variable
  - iterate through 1 to minimum of num1 and num2.
  - test whether a divisor of both. if yes, save to a divisor variable
  - return divisor
=end

def greatest_common_factor(num1, num2)
  divisor = 1
  2.upto([num1.abs, num2.abs].min) do |num|
    if num1 % num == 0 && num2 % num == 0
      divisor = num
    end
  end
  divisor
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'greatest_common_factor(3, 9) == 3: ' +
  (greatest_common_factor(3, 9) == 3).to_s
)
puts(
  'greatest_common_factor(16, 24) == 8: ' +
  (greatest_common_factor(16, 24) == 8).to_s
)
puts(
  'greatest_common_factor(3, 5) == 1: ' +
  (greatest_common_factor(3, 5) == 1).to_s
)
