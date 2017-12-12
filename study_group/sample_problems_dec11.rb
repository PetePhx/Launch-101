=begin
Given an array of primitive values, return an array of subarrays,
where each sub array contains all duplicates of a specific value in the original
array.

[1, 2, 'a', 1, 3, 'a', 3] ===> [ [1,1], [2], [3, 3], ['a', 'a'] ]
=end

=begin

-input: array: primitives: integers, strings
-output: nested array, each subarray contains all duplicates

-algorithm
  -start with an emty array
  - iterate over the elements of the array
    - check with existing subarrays
    - existing elements, add to subarray
    - for new elements, build a new subarray
  - return the new array
=end

def duplicates_subarray(arr)
  new_arr = []
  arr.each do |elm|
    duplicate = false
    new_arr.each do |sub_arr|
      if sub_arr.include?(elm)
        sub_arr << elm
        duplicate = true
      end
    end
    new_arr << [elm] unless duplicate
  end
  new_arr.sort_by {|sub_arr| sub_arr[0].ord }
end

p duplicates_subarray([1, 2, 'a', 1, 3, 'a', 3]) # ==
[ [1,1], [2], [3, 3], ['a', 'a'] ]


# other way of doing it:

=begin
-algo 2:
  - sort the original array
  - make a new empty array
  - push elements to the subarrays
=end

def duplicates_subarray2(arr)
  arr_srt = arr.sort {|a, b| a.ord <=> b.ord}
  new_arr = [[arr_srt[0]]]
  arr_srt.each_with_index do |elm, idx|
    next if idx == 0
    if new_arr[-1].include? elm
      new_arr[-1] << elm
    else
      new_arr << [elm]
    end
  end
  new_arr
end

p duplicates_subarray2([1, 2, 'a', 1, 3, 'a', 3])


# another way: use map, then array multiplication
=begin
-algorithm
  -build an array with uniq elements
  -map it to array of arrays
    inside the map, multiply the array with the count of the elements
  -return new arr
=end

def duplicates_subarray3(arr)
  arr.uniq.map { |elm| [elm] * arr.count(elm)}.sort_by {|subarr| subarr[0].ord }
end

p duplicates_subarray3([1, 2, 'a', 1, 3, 'a', 3])
