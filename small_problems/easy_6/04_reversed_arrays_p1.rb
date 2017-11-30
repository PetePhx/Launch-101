# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed into this method. The return value
# should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(arr)
  (1..arr.length / 2).each do |location|
    idx_left, idx_right = location - 1, -location
    arr[idx_left], arr[idx_right] = arr[idx_right], arr[idx_left]
  end
  arr
end

list = [1, 2, 3, 4]
result = reverse!(list) # => [4,3,2,1]

p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []
