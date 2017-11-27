# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.

# Answer, just do a simple `each` loop:

def running_total arr
  totals = []
  sum = 0
  arr.each do |elm|
    sum += elm
    totals << sum
  end
  totals
end


p [
running_total([2, 5, 13]) == [2, 7, 20],
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67],
running_total([3]) == [3],
running_total([]) == []
  ]

# Annoying one-liner that mutates the caller:
def running_total_2 arr
  arr.each_with_index { |elm, idx| idx == 0 ? next : arr[idx] += arr [idx-1] }
end

puts
p [
running_total_2([2, 5, 13]) == [2, 7, 20],
running_total_2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67],
running_total_2([3]) == [3],
running_total_2([]) == []
  ]

# Further exploration:

# Using Array#each_with_object:

def running_total_3 arr
  sum = 0
  arr.each_with_object([]) do |elm, obj|
    sum += elm
    obj << sum
  end
end

puts
p [
running_total_3([2, 5, 13]) == [2, 7, 20],
running_total_3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67],
running_total_3([3]) == [3],
running_total_3([]) == []
  ]

# Just using map
def running_total_4 arr
  sum = 0
  arr.map { |elm| sum += elm }
end
