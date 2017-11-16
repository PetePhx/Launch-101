def sum_digits num
  num.to_s.chars.map(&:to_i).sum
end

puts sum_digits(23) == 5
puts sum_digits(496) == 19
puts sum_digits(123_456_789) == 45

puts
# not using the array sum method:

def sum_digits num
  num.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum_digits(23) == 5
puts sum_digits(496) == 19
puts sum_digits(123_456_789) == 45
