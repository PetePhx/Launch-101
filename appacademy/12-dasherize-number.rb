# Write a method that takes in a number and returns a string, placing
# a single dash before and after each odd digit. There is one
# exception: don't start or end the string with a dash.
#
# You may wish to use the `%` modulo operation; you can see if a number
# is even if it has zero remainder when divided by two.
#
# Difficulty: medium.

=begin
- input: integer
- output: string. odd numbers with dash before and after
- rules: no dash at the beginning and end of string
- algorithm:
    - convert number to string
    - substitute each odd number with "-number-"
    - remove extra dashes from double dashes
    - remove dashes at the beginning and end, if any
    - return string
=end

def dasherize_number(num)
  str = num.to_s
  str.gsub!(/([13579])/, '-\1-').squeeze!('-')
  str.chop! if str[-1] == '-'
  str = str[1..-1] if str[0] == '-'
  str
end

p dasherize_number('12345')

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'dasherize_number(203) == "20-3": ' +
  (dasherize_number(203) == '20-3').to_s
)
puts(
  'dasherize_number(303) == "3-0-3": ' +
  (dasherize_number(303) == '3-0-3').to_s
)
puts(
  'dasherize_number(333) == "3-3-3": ' +
  (dasherize_number(333) == '3-3-3').to_s
)
puts(
  'dasherize_number(3223) == "3-22-3": ' +
  (dasherize_number(3223) == '3-22-3').to_s
)
