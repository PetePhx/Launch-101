# Double Doubles

# A double number is a number with an even number of digits whose left-side
# digits are exactly the same as its right-side digits. For example, 44, 3333,
# 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless
# the argument is a double number; double numbers should be returned as-is.

def double?(str)
  sz = str.length
  sz.even? && str[0..(sz / 2 - 1)] == str[(sz / 2)..-1]
end

def twice(num)
  double?(num.to_s) ? num : num * 2
end

p [
  twice(37) == 74,
  twice(44) == 44,
  twice(334433) == 668866,
  twice(444) == 888,
  twice(107) == 214,
  twice(103103) == 103103,
  twice(3333) == 3333,
  twice(7676) == 7676,
  twice(123_456_789_123_456_789) == 123_456_789_123_456_789,
  twice(5) == 10
]
# [true, true, true, true, true, true, true, true, true, true]
