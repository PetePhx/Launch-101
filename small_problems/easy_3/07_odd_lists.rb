def oddities in_arr
  out_arr = []
  in_arr.each_with_index { |elm, idx| out_arr << elm if idx.even? }
  out_arr
end

p oddities([2, 3, 4, 5, 6]) # == [2, 4, 6]
p oddities(['abc', 'def']) # == ['abc']
p oddities([123]) # == [123]
p oddities([])    # == []

# Further Exploration

def eventies in_arr
  out_arr = []
  in_arr.each_with_index { |elm, idx| out_arr << elm if idx.odd? }
  out_arr
end

puts
p eventies([2, 3, 4, 5, 6]) # == [3,5]

# Other ways of defining the method oddities:
# using loop-do-end
def oddities_2 in_arr
  out_arr = []
  counter = 0
  loop do
    break if counter >= in_arr.length
    out_arr << in_arr[counter]
    counter += 2
  end
  out_arr
end

puts
p oddities_2([2, 3, 4, 5, 6]) # == [2, 4, 6]
p oddities_2(['abc', 'def']) # == ['abc']
p oddities_2([123]) # == [123]
p oddities_2([])    # == []

# using range object with step(2) method

def oddities_3 in_arr
  out_arr = []
  return out_arr if in_arr == []

  (0..in_arr.length-1).step(2).each {|num| out_arr << in_arr[num]}

  out_arr
end

puts
p oddities_3([2, 3, 4, 5, 6]) # == [2, 4, 6]
p oddities_3(['abc', 'def']) # == ['abc']
p oddities_3([123]) # == [123]
p oddities_3([])    # == []
