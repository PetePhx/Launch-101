puts "Question 1"

# What do you expect to happen when the greeting variable is referenced in the
# last line of the code below?

if false
  greeting = “hello world”
end

greeting

# Answer:
# Since the code within the if block is not run, the variable greeting is initialized
# to nil

# output: (nothing, nil in irb)

# ============================================================================ #
puts
puts 'Question 2'

# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# Answer:
# informal_greeting references the value of the key :a in the hash greetings.
# method << mutates the caller, updating the value to 'hi there'
# we expect output {a: 'hi there'} printed from the second line.

# output:
'''
hi there
{:a=>"hi there"}
'''
# yep
# ============================================================================ #
puts
puts 'Question 3'

# In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.
#
# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.
#
# What will be printed by each of these code groups?
#

# Answers within each section

# A)

# This method does a cycclic permutation of the variables by reassignment.
# Reassignment does not mutate the caller, hence the original values are
# preserved. Expecting original values to be printed in lines 73-75:

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
#output:
'''
one is: one
two is: two
three is: three
'''
# checks out!

# B)
# This method reassigns the variables to strings "two" and "three" and "one"
# as the previous case, reassignment does not mutate the caller.
# We are expeting the original values printed from lines 101-103

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
#output:
'''
one is: one
two is: two
three is: three
'''
# checks out!

# C)
# Well well well. string#gsub! method substitutes the substring in place. Unlike
# the previous two cases, it does mutate the caller.
# Here we expect original values of local variables one, two and three to be
# cyclically permutated to "two","three" and "one", printed from lines 130-132.

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
#output:
'''
one is: two
two is: three
three is: one
'''
# checks out!

# ============================================================================ #
puts
puts 'Question 4'

# Ben was tasked to write a simple ruby method to determine if an input string is
# an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not
# familiar with regular expressions. Alyssa supplied Ben with a method called
# is_an_ip_number? that determines if a string is a valid ip address number and
# asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few
# things. You're not returning a false condition, and you're not handling the case
# that there are more or fewer than 4 components to the IP address (e.g. "4.5.5"
# or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

# Answer
# WE will check for the length of the array and make sure to return a boolean
# for failure cases
# write the is_an_ip_number for testing purpose
def is_an_ip_number?(word)
  (0..255).map(&:to_s).include?(word)
end

def dot_separated_ip_address2?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4
  dot_separated_words.map \
    { |word| is_an_ip_number?(word) }.reduce \
      { |a, b| a && b}
end

puts dot_separated_ip_address2?("4.5.5")              # =>  false
puts dot_separated_ip_address2?("1.2.3.4.5")          # =>  false
puts dot_separated_ip_address2?("192.168.0.1")        # =>  true
puts dot_separated_ip_address2?("255.255.255.255")    # =>  true

# Checks out! :)

# ============================================================================ #
