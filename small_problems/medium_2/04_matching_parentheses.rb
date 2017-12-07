# Matching Parentheses?

# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Note that balanced pairs must each start with a (, not a ).

def balanced?(str)
  diff = 0
  str.chars.each do |chr|
    diff += case chr
            when '(' then 1
            when ')' then -1
            else 0
            end
    return false if diff < 0
  end
  diff == 0
end

p [
  balanced?('What (is) this?') == true,
  balanced?('What is) this?') == false,
  balanced?('What (is this?') == false,
  balanced?('((What) (is this))?') == true,
  balanced?('((What)) (is this))?') == false,
  balanced?('Hey!') == true,
  balanced?(')Hey!(') == false,
  balanced?('What ((is))) up(') == false
]

# Further Exploration

# There are a few other characters that should be matching as well. Square
# brackets and curly brackets normally come in pairs. Quotation marks(single
# and double) also typically come in pairs and should be balanced. Can you
# expand this method to take into account those characters?

def balanced_adv?(str)
  str = str.gsub(/(\w)'(\w)/, '\1\2') # get rid of apstrophies
  char_set = ['\(\)', '\{\}', '\[\]', '\'\'', '\"\"'] # regex needs \ to escape
  str.gsub!(/[^#{char_set.join}]/, '') # get rid of anything not in char_set
  loop do
    len = str.length
    char_set.each do |cset|
      str.gsub!(/#{cset}/, '')
    end
    new_len = str.length
    break if len == new_len # no further shortening
  end
  str.empty?
end

p [
  balanced_adv?('( oh [ hi "mom") it\'s ] me!') == false,
  balanced_adv?('orly?)(yarly!') == false,
  balanced_adv?('([{\'"\'{[(hi!)]}\'"\'}])') == true
]
