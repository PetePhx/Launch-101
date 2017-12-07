# Longest Sentence

# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (.), exclamation points (!), or question marks (?). Any sequence of
# characters that are not spaces or sentence-ending characters should be treated
# as a word. You should also print the number of words in the longest sentence.

# example text: lincoln.text
# longest sentence: length 84

def longest_sentence(filename)
  str = File.read(filename)
  longest = str.split(/[.!?]/).max_by { |sentence| sentence.split(' ').length }
  puts longest.strip
  puts "\nNumber of words: #{longest.split(' ').length}"
end

puts longest_sentence('lincoln.txt')

# It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth

# Number of words: 86

puts longest_sentence('frankenstein.txt')

# "I have seen," he said, "the most
# beautiful scenes of my own country; I have visited the lakes of Lucerne
# and Uri, where the snowy mountains descend almost perpendicularly to
# the water, casting black and impenetrable shades, which would cause a
# gloomy and mournful appearance were it not for the most verdant islands
# that believe the eye by their gay appearance; I have seen this lake
# agitated by a tempest, when the wind tore up whirlwinds of water and
# gave you an idea of what the water-spout must be on the great ocean;
# and the waves dash with fury the base of the mountain, where the priest
# and his mistress were overwhelmed by an avalanche and where their dying
# voices are still said to be heard amid the pauses of the nightly wind;
# I have seen the mountains of La Valais, and the Pays de Vaud; but this
# country, Victor, pleases me more than all those wonders

# Number of words: 157

# Further Exploration

# What about finding the longest paragraph or longest word? How would we go
# about solving that problem?

def longest_word(fname)
  str = File.read(fname)
  words = str.split(/\s|(--)|,/)
  longest = words.max_by(&:length)
  puts "\nThe longest word is '#{longest}' with length #{longest.length}"
end

longest_word('lincoln.txt')
# The longest word is 'proposition' with length 11

longest_word('frankenstein.txt')
# The longest word is 'characteristically' with length 18

def longest_paragraph(fname)
  str = File.read(fname)
  paragraphs = str.split(/(\n\n)|(\r\n\r\n)/)
  longest = paragraphs.max_by { |par| par.split(/\s|(--)|,/).length }
  num_words = longest.split(/\s|(--)|,/).length
  puts "\nThe longest paragraph is the following with #{num_words} words:"
  puts "#{longest.split(' ').first(10).join(' ')} ... \
#{longest.split(' ').last(10).join(' ')}"
end

longest_paragraph('lincoln.txt')

# The longest paragraph is the following with 198 words:
# But, in a larger sense, we can not dedicate, we ... people, for the people,
# shall not perish from the earth.

longest_paragraph('frankenstein.txt')

# The longest paragraph is the following with 1012 words:
# But I have one want which I have never yet ... from the interest and sympathy
# which otherwise he would command.
