# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again. You may assume
# that the strings are of different lengths.

def short_long_short(str1, str2)
  arr = [str1, str2].sort_by(&:length)

  arr[0] + arr[1] + arr[0]
end

puts short_long_short('abc', 'defgh') # == "abcdefghabc"
puts short_long_short('abcde', 'fgh') # == "fghabcdefgh"
puts short_long_short('', 'xyz')      # == "xyz"
