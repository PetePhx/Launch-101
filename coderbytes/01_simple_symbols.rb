=begin
Challenge

Using the Ruby language, have the function SimpleSymbols(str) take the str
parameter being passed and determine if it is an acceptable sequence by either
returning the string true or false. The str parameter will be composed of + and
= symbols with several letters between them (ie. ++d+===+c++==a) and for the
string to be true each letter must be surrounded by a + symbol. So the string to
the left would be false. The string will not be empty and will have at least one
letter.

Sample Test Cases

Input:"+d+=3=+s+"

Output:"true"

Input:"f++d+"

Output:"false"
=end

=begin
-input: string. letters, numbers and symbols
-output: boolean. true if every letter surrounded by +. false otherwise
-algorithm:
  - check first and last characters
  - iterate through second to second to last characters
    - check if a letter
      - if yes, check if surrounded by +
       - if no, return false
  - return true
=end

def simple_symbols(str)
  rng = ('a'..'z').to_a + ('A'..'Z').to_a
  proper = true
  proper = false if rng.include?(str[0]) || rng.include?(str[-1])
  1.upto(str.length - 2) do |idx|
    if rng.include? str[idx]
      proper = false if str[idx - 1] != '+' || str[idx + 1] != '+'
    end
  end
  return proper
end

# p simple_symbols('+h+i+')

=begin
algorithm 2:
  - use regex to check for:
      - letters at the beginning
      - letters at the end
      - letters not preceded or succeeded with '+'
=end

def simple_symbols2(str)
  return false if str =~ /^[a-z]/i || str =~ /[a-z]$/i
  return false if str =~ /[^+][a-z]/i || str =~ /[a-z][^+]/i
  return true
end

# p simple_symbols2('+h+i+')

=begin
  algorithm: single shot
=end

def simple_symbols3(str)
  !(str =~ /[a-z]/i &&
    (str =~ /^[a-z]/i || str =~ /[a-z]$/i ||
     str =~ /[^+][a-z]/i || str =~ /[a-z][^+]/i))
end

p simple_symbols3('+h+i+')
