# Write a method that takes in a string. Your method should return the
# most common letter in the array, and a count of how many times it
# appears.
#
# Difficulty: medium.

=begin
- input: string
- output: array: most common element, number of times it appears
- algorithm:
  - initialize an empty array (of arrays)
  - for each character, add [character, count of character in string] to array
  - return the subarray with the largest 2nd element (i.e. count)
=end

def most_common_letter(str)
  arr = []
  str.each_char { |chr| arr << [chr, str.count(chr)] }
  arr.uniq.max { |e1, e2| e1[1] <=> e2[1]}
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'most_common_letter("abca") == ["a", 2]: ' +
  (most_common_letter('abca') == ['a', 2]).to_s
)
puts(
  'most_common_letter("abbab") == ["b", 3]: ' +
  (most_common_letter('abbab') == ['b', 3]).to_s
)
