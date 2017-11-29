# Letter Swap

# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word is swapped.

# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

def word_swap wrd
  return wrd if wrd.length < 2
  wrd[-1] + wrd[1..-2] + wrd[0]
end

def swap str
  str.split(' ').map {|wrd| word_swap wrd}.join(' ')
end

puts swap('Oh what a wonderful day it is')

p [
  swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si',
  swap('Abcde') == 'ebcdA',
  swap('a') == 'a'
  ]

# Further Exploration

# passing of fist and last characters to a swap method would not work, since the
# string variables are reassigned in the a, b = b, a operation. This woud leave
# the original string unchanged.
