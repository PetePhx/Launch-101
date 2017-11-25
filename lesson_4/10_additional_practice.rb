puts "Problem 1"

# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are
# the positions in the array."

# Answer:

# we could use the #zip method to first build an array of pairs, and then
# convert it to hash:

hash_flint = flintstones.zip((0..flintstones.length-1)).to_h

puts hash_flint
# {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

#==============================================================================#
puts
puts "Problem 2"

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

# Answer: chaining hash#values with array#sum method:

ages_total = ages.values.sum

puts ages_total     # 6174

#==============================================================================#
puts
puts "Problem 3"

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

# Answer:


ages.delete_if {|_, num| num >= 100}

puts ages
# {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

#==============================================================================#
puts
puts "Problem 4"

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Answer:

# Using hash#values and enumerable#min:

min_age = ages.values.min

puts min_age # 10

#==============================================================================#
puts
puts "Problem 5"

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles Bee)

# Find the index of the first name that starts with "Be"

# Answer

idx = nil
flintstones.each_with_index do |str, index|
  if str.start_with? "Be"
    idx = index
    break
  end
end

# or

idx = flintstones.index {|str| str.start_with? "Be"}

puts idx #

#==============================================================================#
puts
puts "Problem 6"

# Amend this array so that the names are all shortened to just the first three
# characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Answer

flintstones.map! {|name| name[0,3]}

p flintstones

#==============================================================================#
puts
puts "Problem 7"

# Create a hash that expresses the frequency with which each letter occurs in this
# string:

statement = "The Flintstones Rock"

# ex:
#
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# Answer
# using #dup so not to mutate the oroginal string
arr = statement.dup.delete(' ').chars
freq_hash = {}

arr.uniq.sort.each do |chr|
  freq_hash[chr] = arr.count(chr)
end

puts freq_hash
puts statement

#==============================================================================#
puts
puts "Problem 8"

# What happens when we modify an array while we are iterating over it? What
# would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# Answer:
# Mutating the array while iterating over it causes a shift in the indices.
# After printing the zeroth element and the shift elemet, the number 3 will be in
# in position 1, and similarly the loop will skip element 4. we expect the loop
# to print numbers 1 and 3:

<<-OUTPUT
1
3
OUTPUT

puts
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# Answer,

# After the first two rounds of the loop, the last two elemets are popped out,
# therefore the loop stops after printing 1 and 2.


<<-OUTPUT
1
2
OUTPUT

#==============================================================================#
puts
puts "Problem 9"

# As we have seen previously we can use some built-in string methods to change the
# case of a string. A notably missing method is something provided in Rails, but
# not in Ruby itself...titleize. This method in Ruby on Rails creates a string
# that has each word capitalized as it would be in a title. For example, the
# string:

words = "the flintstones suck"

# would be:

# words = "The Flintstones Rock"

# Answer
def titleize str
  str.split(' ').map(&:capitalize).join(' ')
end

words_titleized = titleize words

puts words              # the flintstones suck
puts words_titleized    # The Flintstones Suck

#==============================================================================#
puts
puts "Problem 10"

# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the
# family member is in (kid, adult, or senior). Your solution should produce the
# hash below

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  # "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and
# a senior is aged 65+.

# Answer:
# We are not using else in order to avoid assigning age groups when there is
# missing age for a member.

munsters.values.each do |hsh|
  case
  when hsh["age"].between?(0, 17)
    hsh["age_group"] = "kid"
  when hsh["age"].between?(18, 64)
    hsh["age_group"] = "adult"
  when hsh["age"] >= 65
    hsh["age_group"] = "senior"
  end
end

puts munsters

<<-OUTPUT
{"Herman"=>{"age"=>32, "gender"=>"male", "age_group"=>"adult"},
  "Lily"=>{"age"=>30, "gender"=>"female", "age_group"=>"adult"},
  "Grandpa"=>{"age"=>402, "gender"=>"male", "age_group"=>"senior"},
  "Eddie"=>{"age"=>10, "gender"=>"male", "age_group"=>"kid"},
  "Marilyn"=>{"age"=>23, "gender"=>"female", "age_group"=>"adult"}}
OUTPUT

#==============================================================================#
