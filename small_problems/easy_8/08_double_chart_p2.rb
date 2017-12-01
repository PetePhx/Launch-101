# Double Char (Part 2)

# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.

CONSONANTS = (('a'..'z').to_a.join + ('A'..'Z').to_a.join).delete('aeiouAEIOU')

def double_consonants(str)
  str.chars.map { |chr| CONSONANTS.include?(chr) ? chr * 2 : chr }.join('')
end

p [
  double_consonants('String') == "SSttrrinngg",
  double_consonants("Hello-World!") == "HHellllo-WWorrlldd!",
  double_consonants("July 4th") == "JJullyy 4tthh",
  double_consonants('') == ""
]

# using gsub and regex
def double_consonants2(str)
  str.gsub(/[b-df-hj-np-tv-z]/i, '\0\0')
end

# we could also use logic operations within the regexp group:
# /[a-z&&[^aeiou]]/i

p [
  double_consonants2('String') == "SSttrrinngg",
  double_consonants2("Hello-World!") == "HHellllo-WWorrlldd!",
  double_consonants2("July 4th") == "JJullyy 4tthh",
  double_consonants2('') == ""
]
