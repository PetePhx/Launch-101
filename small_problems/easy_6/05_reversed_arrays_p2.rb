# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method
# you wrote in the previous exercise.

def reverse(arr)
  new_arr = []
  arr.each { |elm| new_arr.unshift elm }
  new_arr
end

p [
  reverse([1, 2, 3, 4]) == [4, 3, 2, 1],    # => true
  reverse(%w(a b c d e)) == %w(e d c b a),  # => true
  reverse(['abc']) == ['abc'],              # => true
  reverse([]) == []                         # => true
]

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]

p [
  list.object_id != new_list.object_id,  # => true
  list == [1, 2, 3],                     # => true
  new_list == [3, 2, 1]                  # => true
]

# Further Exploration

# An even shorter solution is possible by using either inject or
# each_with_object. Just for fun, read about these methods in the Enumerable
# module documentation, and try using one in your reverse method.

# Using inject/reduce
def reverse_reduce(arr)
  arr.reduce([]) { |obj, elm| obj.unshift elm }
end

# using each_with_object
def reverse_each_with_object(arr)
  arr.each_with_object([]) { |elm, obj| obj.unshift elm }
end

puts
p [
  reverse_reduce([1, 2, 3, 4]) == [4, 3, 2, 1],    # => true
  reverse_reduce(%w(a b c d e)) == %w(e d c b a),  # => true
  reverse_reduce(['abc']) == ['abc'],              # => true
  reverse_reduce([]) == []                         # => true
]

puts
p [
  reverse_each_with_object([1, 2, 3, 4]) == [4, 3, 2, 1],    # => true
  reverse_each_with_object(%w(a b c d e)) == %w(e d c b a),  # => true
  reverse_each_with_object(['abc']) == ['abc'],              # => true
  reverse_each_with_object([]) == []                         # => true
]
