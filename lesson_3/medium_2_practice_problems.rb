puts "Question 1"

# Predict how the values and object ids will change throughout the flow of the code below:

# Answer: within each section

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id          # object_id of the literal 42
  b_outer_id = b_outer.object_id          # object_id of "forty two"
  c_outer_id = c_outer.object_id          # object_id of array [42]
  d_outer_id = d_outer.object_id          # object_id of the literal 42,
  #                                           since c_outer[0] = 42

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  1.times do
    # local variables outside the block can be accesses here, no problem. so:
    a_outer_inner_id = a_outer.object_id  # object_id of the literal 42
    b_outer_inner_id = b_outer.object_id  # object_id of "forty two"
    c_outer_inner_id = c_outer.object_id  # object_id of array [42]
    d_outer_inner_id = d_outer.object_id  # object_id of the literal 42

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block.\n\n"

#   doing reassignment here. so object_id's are going to change, therefore...
    a_outer = 22                          # object_id of the literal 42
    b_outer = "thirty three"              # object_id of the string "thirty three"
    c_outer = [44]                        # object_id of the array [44]
    d_outer = c_outer[0]                  # object_id of the literal 44,
#                                             since c_outer[0] = 44

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    #  After assignments above, the "inner" variables are now referencing the outer ones, hence
    #  they will have the same object_id's as the outer ones:

    a_inner_id = a_inner.object_id        # object_id of the literal 42
    b_inner_id = b_inner.object_id        # object_id of the string "thirty three"
    c_inner_id = c_inner.object_id        # object_id of the array [44]
    d_inner_id = d_inner.object_id         # object_id of the literal 44,
#                                             since c_outer[0] = 44

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
  end

# since the outer variables are re-assigned inside the code block, their object_id's
# will be different, as expected by the output of the lines below:

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"

# The lines below will raise exceptions due to trying to access inner variables
# from outside the block... hence "ugh ohhhhh"!

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
end

fun_with_ids
# output:
'''
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 47348022434360 before the block.
c_outer is [42] with an id of: 47348022434340 before the block.
d_outer is 42 with an id of: 85 before the block.

a_outer id was 85 before the block and is: 85 inside the block.
b_outer id was 47348022434360 before the block and is: 47348022434360 inside the block.
c_outer id was 47348022434340 before the block and is: 47348022434340 inside the block.
d_outer id was 85 before the block and is: 85 inside the block.

a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 47348022434360 before and: 47348022433280 after.
c_outer inside after reassignment is [44] with an id of: 47348022434340 before and: 47348022433260 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
b_inner is thirty three with an id of: 47348022433280 inside the block (compared to 47348022433280 for outer).
c_inner is [44] with an id of: 47348022433260 inside the block (compared to 47348022433260 for outer).
d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).

a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
b_outer is thirty three with an id of: 47348022434360 BEFORE and: 47348022433280 AFTER the block.
c_outer is [44] with an id of: 47348022434340 BEFORE and: 47348022433260 AFTER the block.
d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.

ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
'''

# ============================================================================ #
puts
puts "Question 2"

# Predict how the values and object ids will change throughout the flow of the
# code below:

# Answer: within each section:

def fun_with_ids2
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id      # object_id of the literal 42
  b_outer_id = b_outer.object_id      # object_id of the string "forty two"
  c_outer_id = c_outer.object_id      # object_id of the array [42]
  d_outer_id = d_outer.object_id      # object_id of the literal 42

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id,
                                        b_outer_id, c_outer_id, d_outer_id)

  # reassignment doesn't mutate the caller. we expect same results as in 140-143:
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"
  # trying to access method local variables from outside... hence "ugh ohhhhh"
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id,
                                             b_outer_id, c_outer_id, d_outer_id)
# methods have their own self contained scope. Variables are passed to methods
# by reference value.
# based on the assignment above on line 145, we have:

  a_outer_inner_id = a_outer.object_id    # object_id of the literal 42
  b_outer_inner_id = b_outer.object_id    # object_id of the string "forty two"
  c_outer_inner_id = c_outer.object_id    # object_id of the array [42]
  d_outer_inner_id = d_outer.object_id    # object_id of the literal 42

  # Here we expect same object_is's as those in line 140-143, since method variables
  # and the corresponding outer local variables are referenceing the same
  # objects in the  memory.

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"

  #  Here the method local variables are reassigned, therefore pointing to
  # different blocks in the memory than in lines 140-143 or 176-179:

  a_outer = 22                          # object_id of the literal 22
  b_outer = "thirty three"              # object_id of the string "thirty three"
  c_outer = [44]                        # object_id of the array [44]
  d_outer = c_outer[0]                  # object_id of the literal 44

  # hence we expect different object_id's to be printed:
  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"

  # defining new local variables and assigning values from local vars. so what.
  # they each have the same object_id as the ones in lines 184-187

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  # variables are just references to memory blocks. we expect the same object_id's
  # as in lines 190-193 to be printed here:

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
end

fun_with_ids2

 #The Output is:
'''
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 47378131980580 before the block.
c_outer is [42] with an id of: 47378131980540 before the block.
d_outer is 42 with an id of: 85 before the block.

a_outer id was 85 before the method and is: 85 inside the method.
b_outer id was 47378131980580 before the method and is: 47378131980580 inside the method.
c_outer id was 47378131980540 before the method and is: 47378131980540 inside the method.
d_outer id was 85 before the method and is: 85 inside the method.

a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 47378131980580 before and: 47378131979680 after.
c_outer inside after reassignment is [44] with an id of: 47378131980540 before and: 47378131979640 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
b_inner is thirty three with an id of: 47378131979680 inside the method (compared to 47378131979680 for outer).
c_inner is [44] with an id of: 47378131979640 inside the method (compared to 47378131979640 for outer).
d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).

a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
b_outer is forty two with an id of: 47378131980580 BEFORE and: 47378131980580 AFTER the method call.
c_outer is [42] with an id of: 47378131980540 BEFORE and: 47378131980540 AFTER the method call.
d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.

ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
'''


# ============================================================================ #
puts
puts "Question 3"

# Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.
#
# Study the following code and state what will be displayed...and why:

# Answer within the section:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"    # reassignment doesn't mutate the caller
  an_array_param << "rutabaga"    # push or << mutate the caller
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

# we expect "pumpkins" for string and ["pumpkins", "rutabaga"] for array:
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# output:
'
My string looks like this now: pumpkins
My array looks like this now: ["pumpkins", "rutabaga"]
'

# checks out!

# ============================================================================ #
puts
puts "Question 4"

#

# To drive that last one home...let's turn the tables and have the string show a
# modified output, while the array thwarts the method's efforts to modify the
# caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'              # string is mutated
  an_array_param = ['pumpkins', 'rutabaga'] # array is reassigned, hence not mutated
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"    # "pumpkinsrutabaga"
puts "My array looks like this now: #{my_array}"      #  ["pumpkins"]

# output:
'''
My string looks like this now: pumpkinsrutabaga
My array looks like this now: ["pumpkins"]
'''

# Check out!

# ============================================================================ #
puts
puts "Question 5"

# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# We could get rid of the if-then-else structure and simply return the boolean:

def color_valid_simple(color)
  color == "blue" || color == "green"
end

p color_valid_simple("blue") # true
p color_valid_simple("grün") # false

# Check out!

# ============================================================================ #
