# Write a method that takes in a number and returns true if it is a
# power of 2. Otherwise, return false.
#
# You may want to use the `%` modulo operation. `5 % 2` returns the
# remainder when dividing 5 by 2; therefore, `5 % 2 == 1`. In the case
# of `6 % 2`, since 2 evenly divides 6 with no remainder, `6 % 2 == 0`.
#
# Difficulty: medium.

=begin
- input: integer
- output: boolean: whether or not number a pwer of 2
- algorithm:
    - if 1, return true
    - check if number id divisible by 2
      - if yes, assign num/2 to 2
    - if num is 1, reutn true, else false
=end

def is_power_of_two?(num)
  return false if num <= 0
  while num % 2 == 0
    num /= 2
  end
  num == 1
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('is_power_of_two?(1) == true: ' + (is_power_of_two?(1) == true).to_s)
puts('is_power_of_two?(16) == true: ' + (is_power_of_two?(16) == true).to_s)
puts('is_power_of_two?(64) == true: ' + (is_power_of_two?(64) == true).to_s)
puts('is_power_of_two?(78) == false: ' + (is_power_of_two?(78) == false).to_s)
# puts('is_power_of_two?(0) == false: ' + (is_power_of_two?(0) == false).to_s)
