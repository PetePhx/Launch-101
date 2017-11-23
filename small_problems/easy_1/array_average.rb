def average arr
  arr.sum / arr.length # add .to_f to force float division
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts
# float
def average_float arr
  arr.sum.to_f / arr.length # add .to_f to enforce float division
end

puts average_float([1, 5, 87, 45, 8, 8]) == 154.0 / 6.0
puts average_float([9, 47, 23, 95, 16, 52]) == 242.0 / 6.0
