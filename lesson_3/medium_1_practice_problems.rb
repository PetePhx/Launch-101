puts "Question 1"

# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).
# For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:
# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

# Answer
str = 'The Flintstones Rock!'

10.times do |num|
  puts ' ' * num + str
end

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!
#    The Flintstones Rock!
#     The Flintstones Rock!
#      The Flintstones Rock!
#       The Flintstones Rock!
#        The Flintstones Rock!
#         The Flintstones Rock!
#          The Flintstones Rock!

#==============================================================================#
puts
puts 'Question 2'

# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# Answer:
# The ruby interpreter gives the following error, indicating not knowing how to
# handle the sum operation between string and integers, i.e. TypeError:
# TypeError: no implicit conversion of Integer into String

# To fix this, we can either use .to_s method, or interpolation:

puts "the value of 40 + 2 is " + (40 + 2).to_s
# the value of 40 + 2 is 42
puts "the value of 40 + 2 is #{(40 + 2)}"
# the value of 40 + 2 is 42

#==============================================================================#
puts
puts 'Question 3'

# Alan wrote the following method, which was intended to show all of the factors
# of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using
# begin/end/until? Note that we're not looking to find the factors for 0 or
# negative numbers, but we just want to handle it gracefully instead of raising
# an exception or going into an infinite loop.

# Bonus 1
# What is the purpose of the number % dividend == 0 ?
# Bonus 2
# What is the purpose of the second-to-last line in the method (the divisors
#   before the method's end)?

# Answer:
# WE could use range with #each method, that would exit gracefully for
# non-positive numbers

def factors(number)
  dividend = number
  divisors = []
  (1..number).to_a.reverse.each do |dividend|
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(12) # [1, 2, 3, 4, 6, 12]
p factors (1) # [1]
p factors(0)  # []
p factors(-1) # []

# Bonus 1: (number % dividend == 0) is to test wether or not the number is
# divisible by dividend

# Bonus 2: the second to last line returns the divisors array


#==============================================================================#
puts
puts 'Question 4'

# # Alyssa was asked to write an implementation of a rolling buffer. Elements are
# added to the rolling buffer and if the buffer becomes full, then new elements
# that are added will displace the oldest elements in the buffer.
#
# # She wrote two implementations saying, "Take your pick. Do you like << or +
# for modifying the buffer?". Is there a difference between the two, other than
#   what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Answer
# In the first method the original variable buffer is mutated, and elements are
# added and subtracted to the original buffer.

# With the second method, the inpute array (inpute_array) is not mutated, and a
# different buffer array is created and returned.

# In terms of use of resources (momory + cpu) the first method is preferrable.

#==============================================================================#
puts
puts 'Question 5'

# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator,
# A user passes in two numbers, and the calculator will keep computing the sequence
# until some limit is reached.
#
# Ben coded up this implementation but complained that as soon as he ran it, he
# got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# How would you fix this so that it works?

# Answer:
# Since limit is a local variable, it is not accessible from the scope of the
# scope of the method. In order to fix this we can change limit to a glocal
# variable, ie $limit

$limit = 15

def fib(first_num, second_num)
  while second_num < $limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
# result is 21

# alternatively, we could pass local variable limit to the method as a parameter.

#==============================================================================#
puts
puts 'Question 6'

# In an earlier practice problem we saw that depending on variables to be modified
# by called methods can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # My string looks like this now: pumpkins
puts "My array looks like this now: #{my_array}" # My array looks like this now: ["pumpkins", "rutabaga"]

# We learned that whether the above "coincidentally" does what we think we wanted
# "depends" upon what is going on inside the method.
#
# How can we refactor this practice problem to make the result easier to predict
# and easier for the next programmer to maintain?

# Answer: within the tricky_method, a_string_param is reassigned hence not mutating
# the original string, while an_array_param is mutated using <<.

# We can refactor to make it easier to follow:

def non_mutating_method(a_string_param)
  a_string_param += "rutabaga"
end

def mutating_method(an_array_param)
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
non_mutating_method(my_string)
mutating_method(my_array)

puts "My string looks like this now: #{my_string}" # My string looks like this now: pumpkins
puts "My array looks like this now: #{my_array}" # My array looks like this now: ["pumpkins", "rutabaga"]

# Alternatively, we could change the push operation in the tricky_method to
# reassignment, and not worry about remembering handling mutating of the
# parameters.

#==============================================================================#
puts
puts 'Question 7'

# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # 34

# Answer
# integers are immutable, therefore mess_with_it doesn't change the value of
# variable answer. The last line prints 42 - 8 or 34.

#==============================================================================#
puts
puts 'Question 8'

# One day Spot was playing with the Munster family's home computer and he wrote
# a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could
# stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?

# Answer:
# Yes, they got ransacked:
#
# {"Herman"=>{"age"=>74, "gender"=>"other"},
#  "Lily"=>{"age"=>72, "gender"=>"other"},
#  "Grandpa"=>
#   {"age"=>444, "gender"=>"other"},
#  "Eddie"=>{"age"=>52, "gender"=>"other"},
#  "Marilyn"=>{"age"=>65, "gender"=>"other"}}
#
# The values in the munsters hash are themselves hashes, therefore mutable.
# the #values mathod passes an array of hashes, and the [] method of the hash
# mutates the caller.

#==============================================================================#
puts
puts 'Question 9'

# Method calls can take expressions as arguments. Suppose we define a function
# called rps as follows, which follows the classic rules of rock-paper-scissors
# game, but with a slight twist that it declares whatever hand was used in the tie
# as the result of that tie.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # paper

# Answer:

# Tracing step by step from inside out:
# rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# =>
# rps(rps("paper", "rock"), "rock")
# =>
# rps("paper", "rock")
# =>
# "paper"

#==============================================================================#
puts
puts 'Question 10'

# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo) # "no"

# Answer:

# foo always returns "yes". bar returns "no" for any input parameter that is not
# "no". Hence "no".
#==============================================================================#
