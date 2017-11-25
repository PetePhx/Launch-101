def xor?(bool_1, bool_2)
  [bool_1, bool_2].one?
end

puts xor?(5.even?, 4.even?) # => true
puts xor?(5.odd?, 4.odd?) # => true
puts xor?(5.odd?, 4.even?) # => false
puts xor?(5.even?, 4.odd?) # => false


# not using the built-in #one? method for array, going old-fashioned:
puts

def xor?(bool_1, bool_2)
  (bool_1 && !bool_2) || (!bool_1 && bool_2)
end

puts xor?(5.even?, 4.even?) # => true
puts xor?(5.odd?, 4.odd?) # => true
puts xor?(5.odd?, 4.even?) # => false
puts xor?(5.even?, 4.odd?) # => false


# Further Exploration

# Xor operation would also be useful in adding of binray digits, where the sum
# zero and one gives one, but zero and zero returns zero and one and one again
# returns zero with a carry bit.

# xor can not be calculated in a short circuit fashion, as unlike && or ||,
# values of both boolean variables are needed to determine the outcome of the
# operation.
