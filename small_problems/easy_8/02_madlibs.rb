# Madlibs

# Mad libs are a simple game where you create a story template with blanks for
# words. You, or another player, then construct a list of words and place them
# into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

def madlibs
  puts "Enter a noun:"
  noun = gets.chomp
  puts "Enter a verb:"
  verb = gets.chomp
  puts "Enter an adjective:"
  adjective = gets.chomp
  puts "Enter an adverb:"
  adverb = gets.chomp

  puts "Do you still #{verb} your #{adjective} #{noun} #{adverb} everyday?"
end

madlibs

# In the last line we could use format:

# puts format("Do you still %s your %s %s %s?", verb, noun, adjective, adverb)
