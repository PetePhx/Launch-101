# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Answer: going line by line:
# array1 is an array of a bunch of strings.
# array2 is empty
# each element of array1 is pushed into array2  in place. (<< mutates the caller)
# strings in array1 staring with C or S are upcased in place (CURLY, SHEMP, etc)
# since strings are immutable, the corresponding elements in array2 are also
# upcased, since they just reference the same objects
# Therefore, we expect output the same as:
# puts %w(Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo)

# Output:
'''
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
'''
# Checks out!


# Further exploration:
# This can cause problem when we want to only affect changes in a single copy of
# mutable object after it has been copied.
# To avoid problems of this sort, we can use the #dup method to duplicate a copy
# of the mutable object:

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup } # duplicate copies are being pushed
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Output:
'''
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
'''

# yep
