
puts "Problem 1"
# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# Answer
# The select method runs the block for each element of the array, and returns
# an array consisting of elements for which the block returned a true/truthy
# value.
# Since 'hi' is the last expression in the block, and that it is a truthy value
# the method will return all elements in the array, i.e. [1,2,3]

# Output in irb/pry:
'''
=> [1, 2, 3]
'''

#==============================================================================#
puts
puts "Problem 2"

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# Answer
# The count method runs the code block for each element, and counts the number
# of element for which the block returned true/truthy. In this case, the
# elements with length less then four are 'ant' and 'cat'. We expect the return
# value 2.

# Output in pry:
'''
=> 2
'''

#==============================================================================#
puts
puts "Problem 3"

# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# Answer
# The method reject is the opposite/complement of select. It returns an array of
# elements for which the block returned a falsy value (false or nil). Since the
# return value of the last expression in the block, puts, is nil, we expect to
# see and array of all elements to be returned: [1, 2, 3]

# Running in pry:
'''
1
2
3
=> [1, 2, 3]
'''

#==============================================================================#
puts
puts "Problem 4"

# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# The each_with_object method takes an enumerable, in this case an array of
# strings, as well as an object, in this case an empty hash, and passes them to
# the code block.
# within the code block, we see that the array elements, referred to as value,
# are passed as values for the hash with the key as the first character of the
# element. i.e. hash['a'] = 'ant' for the first element.
# The method returns the object/hash, which is transformed to:
# {'a'=>'ant', 'b'=>'bear', 'c'=>'cat'}



# running in pry:
'''
=> {"a"=>"ant",
 "b"=>"bear",
 "c"=>"cat"}
'''

#==============================================================================#
puts
puts "Problem 5"

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# Answer
# Just like the shift method for arrays, the shift will remove the first element
# in place in the hash and return it. For hashes, the pairs are transformed to
# arrays of [key, value] form. we expect [:a, 'ant'] returned, and hash
# transformed to {b: 'bear'}

# Testing in pry:
<<-PRY
[1] pry(main)> hash = { a: 'ant', b: 'bear' }
=> {:a=>"ant", :b=>"bear"}
[2] pry(main)> hash.shift
=> [:a, "ant"]
[3] pry(main)> hash
=> {:b=>"bear"}
PRY

#==============================================================================#
puts
puts "Problem 6"

# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# Answer:

# The pop method removes the last element from the array, and returns it. In
# this case, the reutned value, 'caterpillar', is passed to chained method size,
# which returns the length of the string. we expect a return value of 11.

# In pry:
<<-PRY

[1] pry(main)> ['ant', 'bear', 'caterpillar'].pop.size
=> 11

PRY

#==============================================================================#
puts
puts "Problem 7"

# What is the block's return value in the following code? How is it determined?
# Also, what is the return value of any? in this code. What gets output by this
# code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# Answer

# The last expression evaluated in the block is num.odd?, hence the block
# returns true/false based on whether the number is odd or even, respectively.
# For the any? method, it only takes one element to return truthy in order for
# the method to return true. In this case, since we have at least one odd
# elements in the array, the method returns true.
# the ouput of the code is the first array element 1 printed, and since the
# block returns true for 1, the method stops the iteration and returns true.

# In Pry:

<<-PRY

[10] pry(main)> [1, 2, 3].any? do |num|
[10] pry(main)*   puts num
[10] pry(main)*   num.odd?
[10] pry(main)* end
1
=> true

PRY

#==============================================================================#
puts
puts "Problem 8"


# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# Answer

# The method enumerable#take takes the first n element of the object, and
# returns them in a new array, hence non-destructive. We expect a return value:
# [1,2]

# Trying in pry:

<<-PRY

[5] pry(main)> arr = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
[6] pry(main)> arr.take(2)
=> [1, 2]
[7] pry(main)> arr
=> [1, 2, 3, 4, 5]

PRY

#==============================================================================#
puts
puts "Problem 9"

# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# Answer

# The map method runs the block for each element of the hash, and returns an
# array the same length as the original enumerable object with the transformed
# elements. In this case, the block has an if clause that returns the hash value
# for string length larger than three, and (implicitly) nil otherwise. We expect
# the returned array: [nil, 'bear']

# Running in Pry:

<<-PRY

[1] pry(main)> { a: 'ant', b: 'bear' }.map do |key, value|
[1] pry(main)*   if value.size > 3
[1] pry(main)*     value
[1] pry(main)*   end
[1] pry(main)* end
=> [nil, "bear"]

PRY

#==============================================================================#
puts
puts "Problem 10"

# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# Answer

# The if clause in the block prints the number for numbers larger than 1, and
# then returns nil. otherwise, it returns the number itself. Based on the return
# values of the block, we expect the following array returned by map:
# [1, nil, nil]

# Testing in pry:

<<-PRY

[3] pry(main)> [1, 2, 3].map do |num|
[3] pry(main)*   if num > 1
[3] pry(main)*     puts num
[3] pry(main)*   else
[3] pry(main)*     num
[3] pry(main)*   end
[3] pry(main)* end
2
3
=> [1, nil, nil]

PRY

#==============================================================================#
