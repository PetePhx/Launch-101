=begin

Merge Sort

Sort an array of passed in values using merge sort. You can assume that this
array may contain only one type of data. And that data may be either all numbers
or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the
array elements into nested sub-arrays, then recombining those nested sub-arrays
in sorted order. It is best shown by example. For instance, let's merge sort the
array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

We then work our way back to a flat array by merging each pair of nested
sub-arrays:

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]

Examples:

merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

=end

=begin
- input: one array
- output: sorted array
- algorithm:
  - if length of input array 1 or 0, return it
  - else,
    - break it to two halves (almost equal in size),
    - sort each half
    - merge sorted halves
  - return sorted array
=end

def merge(array1, array2)
  arr1, arr2 = array1.dup, array2.dup
  out_arr = []
  until arr1.empty? || arr2.empty?
    out_arr << (arr1[0] <= arr2[0] ? arr1 : arr2).shift
  end
  out_arr + arr1 + arr2
end

def sort(arr)
  return arr if arr.length < 2
  sz = arr.size
  arr1, arr2 = arr[0..(sz/2 - 1)], arr[sz/2..(sz - 1)]
  merge(sort(arr1), sort(arr2))
end

p sort([2,1,0])

=begin
Further Exploration

Every recursive algorithm can be reworked as a non-recursive algorithm. Can you
write a method that performs a non-recursive merge sort?
=end
