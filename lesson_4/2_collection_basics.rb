# How would you reference 'grass' from within this string? Try it out in irb.

str = 'The grass is green'

puts str[4, 5]        # grass
puts str.slice(4, 5)  # grass

puts

# What do you think would be returned here? Try it out in irb.

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]       #  ['c', 'd', 'e']
arr[2, 3][0]    #  'c'

puts arr[2, 3]
puts arr[2, 3][0]

# When initializing a hash, the keys must be unique. Try the following code out
# in irb.

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

# What happened? the value for the key 'fruit' is overwritten.

'''
(pry):1: warning: key "fruit" is duplicated and overwritten on line 1
=> {"fruit"=>"pear", "vegetable"=>"carrot"}
'''

puts

# What do you think would be returned by the following calls?

str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6]
arr[-6]

# -6 is out of bounds for a five-element string/array, hence expecting nil.

puts

# Try the following code out in irb.

str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"

# in order to join the words with spaces in between, we have to supply it as a
# parameter:

arr.join(' ')   # =>  "How do you get to Carnegie Hall?"

# to preserve the spaces, we can split in word boundaries:

 arr = str.split(/\b/)
 arr.join           # =>  "How do you get to Carnegie Hall?"

# What do you think would happen if #to_h was called on the following array?
# Read up on Array#to_h in the Ruby documentation and try it out in irb.

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]

# the .to_h array method is the opposite of .to_a method for hashes. we expect
# a hash object with keys and values corresponding to 0th and 1st elements of
# each array element:

arr.to_h
# => {:name=>"Joe", :age=>10, :favorite_color=>"blue"}


puts

# Using the same element assignment method, how would you change the first
# letter of the remaining words in the sentence to their uppercase versions?

str = "joe's favorite color is blue"
ind = "0123456789012345678901234567"

str[0] = 'J'
str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'

puts str  # Joe's Favorite Color Is Blue

puts

# In irb or a code file use the same method to increase the value of the rest
# of the integers in the array by 1.

arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr[1] += 1 # => 3
arr[2] += 1 # => 4
arr[3] += 1 # => 5
arr[4] += 1 # => 6

p arr    #  [2, 3, 4, 5, 6]

puts

# In irb or a code file use the same method to set a value of either 'Fruit' or
# 'Vegetable' to each element in the hash.

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'

p hsh

# {:apple=>"Fruit", :carrot=>"Vegetable", :pear=>"Fruit", :broccoli=>"Vegetable"}
