# Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be arranged
# in the same sequence as the substrings appear in the string. Duplicate
# palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous
# exercise.

# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

# the single-shot substrings from previous exercise:
def substrings(str)
  (0..str.length - 1).each_with_object([]) do |idx1, arr|
    (idx1..str.length - 1).each do |idx2|
      arr << str[idx1..idx2]
    end
  end
end

def palindromes(str)
  substrings(str).select { |subs| subs.length > 1 && subs == subs.reverse }
end

p [
  palindromes('abcd') == [],
  palindromes('madam') == ['madam', 'ada'],
  palindromes('hello-madam-did-madam-goodbye') == [
    'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
    'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
    '-madam-', 'madam', 'ada', 'oo'
  ],
  palindromes('knitting cassettes') == [
    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
  ]
]
# [true, true, true, true]
