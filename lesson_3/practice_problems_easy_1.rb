puts "Question 1"
# What would you expect the code below to print out?
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# uniq does not mutate the caller, therefore it executes
# puts [1, 2, 2, 3]

#==============================================================================
puts "Question 2"
#
# Describe the difference between ! and ? in Ruby. And explain what would
# happen in the following scenarios:
#
#     what is != and where should you use it?
#     A) the opposit of == i.e. not equal

#     put ! before something, like !user_name
#     A) it negates the truthy value of the object.
puts !"hi" # prints false
#     put ! after something, like words.uniq!
#     A) Unless a method by ! at the end is defined, it will raise exception.

#     put ? before something
#     A) does not have a particular meaning.

#     put ? after something
#     A) used to indicate boolean values/methods in naming convention

#     put !! before something, like !!user_name
#     A) double negation of the truthy value, i.e. truthiness of the object.
puts !!"hi" # prints true
#==============================================================================

puts "Question 3"
#
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!("important", "urgent")

puts advice
# Few things in life are as urgent as house training your pet dinosaur.


# Also using [pattern]

advice = "Few things in life are as important as house training your pet dinosaur."

advice["important"] = "urgent"

puts advice
# Few things in life are as urgent as house training your pet dinosaur.

#==============================================================================

puts "Question 4"

# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) # deletes element "at" position 1, i.e. 2.
puts numbers # same as puts [1,3,4,5]

numbers = [1, 2, 3, 4, 5]

numbers.delete(1) # deletes element 1 from the array

puts numbers # same as puts [2,3,4,5]

# delete_at() removes based on position/index. delete() removes based on value.
# both methods mutate the caller.
#==============================================================================

puts 'Question 5'

# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

puts (10..100).include?(42) # true
# also:
puts (10..100).cover?(42) # true
# and
puts (10..100).member?(42) # true

#==============================================================================

puts "Question 6"

# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

# 1)

famous_words.insert(0, "Four score and ")

puts famous_words
# Four score and seven years ago...

#2) prepend
famous_words = "seven years ago..."

famous_words.prepend "Four score and "

puts famous_words
# Four score and seven years ago...


#3) assignment with concat or +
famous_words = "seven years ago..."

famous_words = "Four score and ".concat(famous_words)

puts famous_words
# Four score and seven years ago...

#==============================================================================

puts "Question 7"

# Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# This gives us a string that looks like a "recursive" method call:

# "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
#
# If we take advantage of Ruby's Kernel#eval method to have it execute
#this string as if it were a "recursive" method call
#
eval(how_deep) # 42
#
# what will be the result?

# Answer: We are essentially executing the add_eight method five times on the
# input 2, expecting 2 + 8 * 5, or 42.

#==============================================================================
puts "Question 8"

# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:
#
# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
#
# Make this into an un-nested array.

# Answer: we use flatten (or flatten! for mutating) to get a flat array:

flintstones.flatten!

p flintstones

# ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]

#==============================================================================

puts "Question 9"

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3,
                "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and
# Barney's number

# Answer: we can use the # select method to select the sub-hash, and the the
# #to_a method to convert the hash to an array of arrays, and then flatten:

barney =  flintstones.select {|k,v| k == "Barney"}.to_a.flatten
p barney
# ["Barney", 2]

# also simply using the #assoc method:
barney = flintstones.assoc("Barney")
p barney
# ["Barney", 2]

#==============================================================================
