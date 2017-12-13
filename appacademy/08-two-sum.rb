# Write a method that takes an array of numbers. If a pair of numbers
# in the array sums to zero, return the positions of those two numbers.
# If no pair of numbers sums to zero, return `nil`.
#
# Difficulty: medium.

def two_sum(num_arr)
  sz = num_arr.size
  0.upto(sz - 2) do |idx_1|
    (idx_1 + 1).upto(sz - 1) do |idx_2|
      return [idx_1, idx_2] if num_arr[idx_1] + num_arr[idx_2] == 0
    end
  end
  nil
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'two_sum([1, 3, 5, -3]) == [1, 3]: ' + (two_sum([1, 3, 5, -3]) == [1, 3]).to_s
)
puts(
  'two_sum([1, 3, 5]) == nil: ' + (two_sum([1, 3, 5]) == nil).to_s
)
