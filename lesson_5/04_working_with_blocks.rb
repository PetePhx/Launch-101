# Example 3

# Let's mix it up a little bit and have you try taking apart an example on your
# own.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Map out a detailed breakdown for the above example using the same approach as
# the previous two examples. What do you think will be returned and what will
# be the side-effects?

# Answer

# In the first line, the #map method iterates through each element of the array.
# The elements are arrays themselves, referred to as arr inside the map block.
# In the second line, the first element of each array is printed: 1 for [1, 2]
# and 3 for [3, 4]
# In the third line the first element of each array is returned, which becomes
# the return value of the block.
# The #map method uses the return values from the block to construct a new
# array.

# Hence we expect 1 and 3 printed, and the array [1, 3] returned.

<<-PRY

1
3
=> [1, 3]

PRY

# ============================================================================ #
# Example 4

# Here's another example.

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# Can you take this code apart, just like before? What will be PRY and what
# will be the value of my_arr? Check the solution below once you have tried this
# on your own.

# Answer:

# In the first line we have #each iterating over an array of arrays. We know
# that #each returns the original object iterated over, threfore my_arr is also
# expected to be [[18, 7], [3, 12]].

# within the #each block, we have another #each iterating over the elements of
# the inner array, printing those larger than 5. We expect PRY of 18, 7, 12.

<<-PRY

18
7
12
=> [[18, 7], [3, 12]]

PRY

# ============================================================================ #
# Example 5

# Next, let's tackle a slightly more complex example.

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# What will the return value be in this example? Use what you've learned so far
# to break it down on your own before checking the solution below.

# Answer

# in the first line we have #map iterating over the element of an array, that
# are arrays themselves.
# in the second line, we have another #map method iterating over the integer
# elements of the inner arrays, returning 2 times the value.
# the rturned values are used by the inner #map to build new arrays, that are
# in turn passed to the outer #map, that returns a new array of arrays.

# Based on the logic presented above, we expect the returned array:
# [[2, 4], [6, 8]]


<<-PRY

=> [[2, 4], [6, 8]]

PRY

# ============================================================================ #
# Example 6

# Let's mix it up now with some variation. In the below example, we have an
# array of hashes, and we want to select all elements where every key matches
# the first letter of the value. Note that the keys are symbols here, so we'll
# have to do some conversion before comparison.

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

# There's a lot going on here, but you now possess all the necessary knowledge
# to take this apart, line by line, letter by letter. We won't do a full table
# of steps like before, but see if you understand every line and every letter
# in the code above. If you do not, take your time and study it; you should be
# able to deconstruct this code to its core.

# Answer

# in the first line we have an array of hashes, with the #select method applied.
# inside the select method in the second line we have the #all? method applied
# to each hash. #all? is checking whether a given condition in the #all? block
# returns true for all elements of an Enumerable object. The condition checked
# in line 3 is to see whether the first character of the value in a key-value
# pair is equal to the key turned to string. if the condition returns true for
# all hash pairs, the bloc returns true, which becomes the #select block value,
# which in turn is used by #select to decide whether an element is included in
# the returned object.

# based on this analysis, we expect the return value:
# => [{ :c => "cat" }]

<<-PRY

=> [{:c=>"cat"}]

PRY

# ============================================================================ #
# Example 10

# Let's say we have the following data structure of nested arrays and we want
# to increment every number by 1 without changing the data structure.

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# This example is more complicated than the rest, but at this point you should
# be able to break it down effectively. Use the tools you've learned about in
# this lesson and take as much time as needed. Work on breaking down each
# component and understanding the return value of each expression. What will
# be the final return value?

# Answer

# In the first line we have an array of objects, the first one being an array of
# arrays and the second one an array. Running #map on these two objects, we
# have in line 2 inside the block another #map operation iterating over elements
# of these inner arrays. The if clause checks to see whether the length of the
# string obtained from the object is equal to one as a means to differentiate
# between integers and arrays. For integers, we have a transformation of adding
# one to the integer. For an array (third level) we have a third level #map
# operation adding one to each element of the third level array, returning the
# transformed arrays. These arrays in trurn are returned throught the second
# level and first level #map blocks. Hence we expect the following return value:
#
# [[[2, 3], [4, 5]], [6, 7]]

<<-PRY

=> [[[2, 3], [4, 5]], [6, 7]]

PRY

# ============================================================================ #
