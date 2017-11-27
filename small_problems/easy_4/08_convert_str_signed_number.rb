#  Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading + or - sign; if the first
# character is a +, your method should return a positive number; if it is a -,
# your method should return a negative number. If no sign is given, you should
# return a positive number.

# Using the string_to_integer from the previous method:

DIGITS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
            '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer str
  digits_arr = str.reverse.chars.map {|chr| DIGITS[chr]}

  number = 0
  digits_arr.each_with_index do |digit, idx|
    number += digit * 10**idx
  end
  number
end

def string_to_signed_integer str
  case str[0]
  when '-'
    -1 * string_to_integer(str[1..-1])
  when '+'
    string_to_integer str[1..-1]
  else
    string_to_integer str
  end
end

p [string_to_signed_integer('4321') == 4321,
  string_to_signed_integer('-570') == -570,
  string_to_signed_integer('+100') == 100]

# Further Exploration

# In our solution, we call string[1..-1] twice, and call string_to_integer
# three times. This is somewhat repetitive. Refactor our solution so it only
# makes these two calls once each.

def string_to_signed_integer_2 str
  sign = 1
  case
  when str[0] == '-' || str[0] == '+'
    sign = -1 if str[0] == '-'
    substr = str[1..-1]
  else
    substr = str
  end
  sign * string_to_integer(substr)
end

puts
p [string_to_signed_integer_2('4321') == 4321,
  string_to_signed_integer_2('-570') == -570,
  string_to_signed_integer_2('+100') == 100]
