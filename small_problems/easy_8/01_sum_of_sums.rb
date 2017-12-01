# Sum of Sums

# Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array. You may assume that the
# Array always contains at least one number.

def sum_of_sums(arr)
  multipliers_arr = (1..arr.length).to_a.reverse
  arr.zip(multipliers_arr).map { |a, b| a * b }.sum
end

p [
  sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2), # -> (21)
  sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3), # -> (36)
  sum_of_sums([4]) == 4,
  sum_of_sums([1, 2, 3, 4, 5]) == 35
]
# [true, true, true, true]

# we can use the fact that zip accepts range objects:

def sum_of_sums2(arr)
  arr.zip(arr.length.downto(1)).map { |a, b| a * b }.sum
end

p [
  sum_of_sums2([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2), # -> (21)
  sum_of_sums2([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3), # -> (36)
  sum_of_sums2([4]) == 4,
  sum_of_sums2([1, 2, 3, 4, 5]) == 35
]
