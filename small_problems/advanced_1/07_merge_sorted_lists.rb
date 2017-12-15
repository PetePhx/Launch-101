=begin

Merge Sorted Lists

Write a method that takes two sorted Arrays as arguments, and returns a new
Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You
must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

=end

def merge(array1, array2)
  arr1, arr2 = array1.dup, array2.dup
  out_arr = []
  until arr1.empty? || arr2.empty?
    out_arr << (arr1[0] <= arr2[0] ? arr1 : arr2).shift
  end
  out_arr + arr1 + arr2
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
