def is_odd? num
  num % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

def is_odd_using_remainder? num
  num.abs.remainder(2) == 1
end

puts
puts is_odd_using_remainder?(2)   # => false
puts is_odd_using_remainder?(5)   # => true
puts is_odd_using_remainder?(-17) # => true
puts is_odd_using_remainder?(8)   # => false
puts is_odd_using_remainder?(0)   # => false
puts is_odd_using_remainder?(7)   # => true
