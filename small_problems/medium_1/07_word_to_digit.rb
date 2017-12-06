# Word to Digit

# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

NUM_WORDS = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
              'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }

def word_to_digit(str)
  NUM_WORDS.each do |key, val|
    str.gsub!(key, val.to_s)
  end
  str
end

p [
word_to_digit("Please call me at five five five one two three four. \
Thanks.") == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
]

# Note: if we want to only substitute the number strings that are whole words,
# i.e. separated by word boundaries, then we need to use regexp with \b
# Note: regexp can perform interpolation

def word_to_digit2(str)
  NUM_WORDS.each do |key, val|
    str.gsub!(/\b#{key}\b/, val.to_s)
  end
  str
end

p [
  word_to_digit2("Please call me at five five five one two three four. \
Thanks.") == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
]

# Further Exploration

# Can you change your solution this so the spaces between consecutive numbers
# are removed? Suppse the string already contains two or more space separated
# numbers (not words); can you leave those spaces alone, while removing any
# spaces between numbers that you create?

# What about dealing with phone numbers? Is there any easy way to format the
# result to account for phone numbers? For our purposes, assume that any 10
# digit number is a phone number, and that the proper format should be
# "(123) 456-7890".

# One way to solve this problem would be to first insert a predefined pattern
# in the string before and after the numbers, then translate numbers, then
# remove the spaces between the pattern, then the patterns themselves:

def word_to_digit3(str)
  insert_pat = "%$@!~&:^/*" # an unlikely pattern to occur in a text
  NUM_WORDS.each.each do |key, val| # insert pattern
    str.gsub!(/\b#{key}\b/, "#{insert_pat}#{val}#{insert_pat}")
  end
  # get rid of space:
  str.gsub!("#{insert_pat} #{insert_pat}", "#{insert_pat}#{insert_pat}")
  str.gsub!("#{insert_pat}", '') # :get rid of pattern
end

p [
  word_to_digit3("Please call me at five five five one two three four. \
Thanks.") == 'Please call me at 5551234. Thanks.',
  word_to_digit3("The PIN number four is 7 8 9 0.") == \
"The PIN number 4 is 7 8 9 0."
]

# for the phone number, we use a regex substitution:

def word_to_digit4(str)
  insert_pat = "%$@!~&:^/*" # an unlikely pattern to occur in a text
  NUM_WORDS.each.each do |key, val| # translate, insert pattern before/after
    str.gsub!(/\b#{key}\b/, "#{insert_pat}#{val}#{insert_pat}")
  end
  # get rid of space:
  str.gsub!("#{insert_pat} #{insert_pat}", "#{insert_pat}#{insert_pat}")
  str.gsub!("#{insert_pat}", '') # :get rid of pattern
  #phone number formatting:
  str.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  str
end

p [
  word_to_digit4("Please call me at one two three five five five \
six seven eight nine. Thanks.") == 'Please call me at (123) 555-6789. Thanks.',
  word_to_digit4("The PIN number four is 7 8 9 0.") == \
"The PIN number 4 is 7 8 9 0."
]

# using pure regex: add space before every word, while removing space after
# translated numbers, then remove all extra spaces using squeeze and strip.

def word_to_digit5(str)
  str.gsub!(/\w+[ ]?/) { |w| NUM_WORDS[w.downcase.strip] || ' ' + w }
  str.squeeze!(' ')
  str.strip!
  str.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  str
end

p [
  word_to_digit5("Please call me at one two three five five five \
six seven eight nine. Thanks.") == 'Please call me at (123) 555-6789. Thanks.',
  word_to_digit5("The PIN number four is 7 8 9 0.") == \
"The PIN number 4 is 7 8 9 0."
]
