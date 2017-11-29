# Clean up the words

# Given a string that consists of some words and an assortment of non-alphabetic
# characters, write a method that returns that string with all of the non-
# alphabetic characters replaced by spaces. If one or more non-alphabetic
# characters occur in a row, you should only have one space in the result (the
# result should never have consecutive spaces).

def cleanup str
  str2 = str.gsub(/[^A-Za-z]/, ' ')
  str3 = str2.gsub(/[ ]{2,}/, ' ')
end

# we could also use str2.squeeze(' ') instead of gsub in line 11

p cleanup("---what's my +*& line?") == ' what s my line '

# Further Exploration

# If you originally wrote this method with regular expressions, try writing it
# without regular expressions.

def cleanup_noregexp str
  str2 = ''
  str.chars.each do |chr|
    case chr.downcase
    when ('a'..'z')
      str2 << chr
    else
      str2 << ' '
    end
  end
  str2.squeeze(' ')
end

p cleanup_noregexp("---what's my +*& line?") == ' what s my line '
