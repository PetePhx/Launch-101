def multiply(num_1, num_2)
  num_1 * num_2
end

def square num
  multiply(num, num)
end

puts square(5) # => 25
puts square(-8) # => 64

# Further Exploration: How would you implement power to the n?

def power(num, power)
  num_arr = [num] * power

  num_arr.reduce {|product, num| multiply(product, num)}
end

puts power(10, 6) # 1000000
