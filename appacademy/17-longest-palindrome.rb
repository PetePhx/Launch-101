# Write a method that takes in a string of lowercase letters (no
# uppercase letters, no repeats). Consider the *substrings* of the
# string: consecutive sequences of letters contained inside the string.
# Find the longest such string of letters that is a palindrome.
#
# Note that the entire string may itself be a palindrome.
#
# You may want to use Array's `slice(start_index, length)` method,
# which returns a substring of length `length` starting at index
# `start_index`:
#
#     "abcd".slice(1, 2) == "bc"
#     "abcd".slice(1, 3) == "bcd"
#     "abcd".slice(2, 1) == "c"
#     "abcd".slice(2, 2) == "cd"
#
# Difficulty: hard.

def palindrome?(string)
  i = 0
  while i < string.length
    if string[i] != string[(string.length - 1) - i]
      return false
    end

    i += 1
  end

  return true
end

=begin
- input: string.
- ouput: string. largest palindromic substring
- rules: palindrome should be at least 2 characters
- algorithm:
    - write a method to return all substrings
    - select substrings 2 characters or longer
    - select the ones that are palindromes
    - select the longest one. return.
=end

def substrings(str)
  arr = []
  0.upto(str.size - 1) do |idx_1|
    idx_1.upto(str.size - 1) do |idx_2|
      arr << str[idx_1..idx_2]
    end
  end
  arr
end

def longest_palindrome(str)
  sub_arr = substrings(str).select { |substr| substr.length >= 2}
  sub_arr.select { |substr| palindrome?(substr) }.sort_by(&:length).last
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'longest_palindrome("abcbd") == "bcb": ' +
  (longest_palindrome('abcbd') == 'bcb').to_s
)
puts(
  'longest_palindrome("abba") == "abba": ' +
  (longest_palindrome('abba') == 'abba').to_s
)
puts(
  'longest_palindrome("abcbdeffe") == "effe": ' +
  (longest_palindrome('abcbdeffe') == 'effe').to_s
)
