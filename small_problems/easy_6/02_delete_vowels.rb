# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.

VOWELS = 'aeiouAEIOU'

def remove_vowels(str_arr)
  str_arr.map { |str| str.delete(VOWELS) }
end

p [
  remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz),
  remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht),
  remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
]
