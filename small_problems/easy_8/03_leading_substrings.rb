# Leading Substrings

# Write a method that returns a list of all substrings of a string that start
# at the beginning of the original string. The return value should be arranged
# in order from shortest to longest substring.

def substrings_at_start(str)
  (1..str.length).map { |size| str[0, size] }
end

p [
  substrings_at_start('abc') == ['a', 'ab', 'abc'],
  substrings_at_start('a') == ['a'],
  substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy'],
  substrings_at_start('') == []
]
