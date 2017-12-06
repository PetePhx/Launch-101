# Rotation (Part 1)

# Write a method that rotates an array by moving the first element to the end of
# the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
  return [] if arr.empty?
  arr[1..-1] + arr[0, 1]
end

p [
  rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7],
  rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a'],
  rotate_array(['a']) == ['a'],
  rotate_array([]) == []
]

# using splat operator *

def rotate_array2(arr)
  [*arr[1..-1], *arr[0, 1]]
end

p [
  rotate_array2([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7],
  rotate_array2(['a', 'b', 'c']) == ['b', 'c', 'a'],
  rotate_array2(['a']) == ['a'],
  rotate_array2([]) == []
]

def rotate_string(str)
  return '' if str.empty?
  str[1..-1] + str[0, 1]
end

p [
  rotate_string('Hello') == 'elloH',
  rotate_string('i') == 'i',
  rotate_string('') == ''
]
