# The End Is Near But Not Here

# Write a method that returns the next to last word in the String passed to it
# as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(str)
  str.split(' ')[-2]
end

p [
  penultimate('last word') == 'last',
  penultimate('Launch School is great!') == 'is'
]

# Further Exploration

#  Write a method that returns the middle word of a phrase or sentence. It
# should handle all of the edge cases you thought of.

# for even number of words, this gives the one on the left of the mid point:

def mid_word(str)
  words_arr = str.split(' ')
  words_arr[(words_arr.length - 1) / 2]
end

p [
  mid_word('hey whats up?') == 'whats',
  mid_word('hello') == 'hello',
  mid_word('one two') == 'one',
  mid_word('').nil?
]
