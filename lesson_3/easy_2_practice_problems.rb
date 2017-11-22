puts "Question 1"

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

# Bonus: What are two other hash methods that would work just as well for this
# solution?

# Answer: the #key? method provides a simple way to verify ket presence:
puts ages.key?("Spot")

# other methods: #include?, #member?, and #has_key?
puts ages.include?("Spot")
puts ages.member?("Spot")
puts ages.has_key?("Spot")

# #assoc returns an array, or nil if the key is not found:
puts !ages.assoc("Spot").nil?

#==============================================================================
puts
puts "Question 2"

# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original
# munsters_description above):

# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# Answer:
# "The munsters are creepy in a good way."

munsters_description.capitalize!
# or we could run:
# munsters_description[4] = 'm'
puts munsters_description


# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description = "The Munsters are creepy in a good way."

munsters_description.swapcase!

puts munsters_description

# "the munsters are creepy in a good way."
munsters_description = "The Munsters are creepy in a good way."

munsters_description.downcase!

puts munsters_description

# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description = "The Munsters are creepy in a good way."

munsters_description.upcase!

puts munsters_description

#==============================================================================
puts
puts "Question 3"

# We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# Answer: using #merge!

ages.merge! additional_ages

p ages

#==============================================================================
puts
puts "Question 4"

# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

# Answer: using #index, see if it returns nil:

puts advice.index("Dino") != nil

# or using the #include? method:

puts advice.include?("Dino")

# or regexp:

puts (advice =~ /Dino/) != nil

#==============================================================================
puts
puts "Question 5"

# Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# Answer:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones

#==============================================================================
puts
puts "Question 6"

# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Answer: using push or <<

flintstones << "Dino"

p flintstones

#==============================================================================
puts
puts "Question 7"
#
# In the previous practice problem we added Dino to our array like this:
#
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << "Dino"
#
# We could have used either Array#concat or Array#push to add Dino to the family.
#
# How can we add multiple items to our array? (Dino and Hoppy)

# Answer:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.concat %w(Dino Hoppy)

p flintstones

#==============================================================================
puts
puts "Question 8"

# Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".
#
# Review the String#slice! documentation, and use that method to make the return
# value "Few things in life are as important as ". But leave the advice variable
# as "house training your pet dinosaur.".
#
# As a bonus, what happens if you use the String#slice method instead?

# Answer:
# Shortening in place using #index:

advice[advice.index("house")..-1] = ''

p advice

# Using #slice!,
advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, advice.index('house'))

p advice

# using #slice instead of #slice!, the original string isn't mutated

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice(0, advice.index('house'))

p advice
# "Few things in life are as important as house training your pet dinosaur."

#==============================================================================
puts
puts "Question 9"

# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

puts statement.count('t') # 2

#==============================================================================
puts
puts "Question 10"

# Back in the stone age (before CSS) we used spaces to align things on the screen.
# If we had a 40 character wide table of Flintstone family members, how could we
# easily center that title above the table with spaces?

title = "Flintstone Family Members"

# Answer: use string #center method
puts '=' * 40
puts title.center(40)
puts '=' * 40

#==============================================================================
