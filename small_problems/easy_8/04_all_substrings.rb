# All Substrings

# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
# substrings that start at position 1, and so on. Since multiple substrings will
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the
# previous exercise:

# from previous exercise:
def substrings_at_start(str)
  (1..str.length).map { |size| str[0, size] }
end

def substrings(str)
  (0..str.length - 1).each_with_object([]) do |idx, arr|
    arr.concat substrings_at_start(str[idx..-1])
  end
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# Note: we could not use the Array#+ operation here instead of concat, as it
# would cause the array to be reset to [] at each oteration

# This implementation is WRONG. To see the effect, uncomment the pry lines:
require 'pry'
def substrings_bad(str)
  (0..str.length - 1).each_with_object([]) do |idx, arr|
    # binding.pry
    arr += substrings_at_start(str[idx..-1])
    # binding.pry
  end
end

p substrings_bad('abcde') # => []

# trying to write a method not using the from_start method from previous
# exercise:

def substrings_single_shot(str)
  (0..str.length - 1).each_with_object([]) do |idx1, arr|
    (idx1..str.length - 1).each do |idx2|
      arr << str[idx1..idx2]
    end
  end
end

p substrings_single_shot('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
