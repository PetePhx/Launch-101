# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by
# adding the ability to represent negative numbers as well.

# From previous method:

CHARS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string num
  str = ''
  loop do
    digit = CHARS[num % 10]
    str += digit
    num /= 10
    break if num == 0
  end
  str.reverse
end

def signed_integer_to_string num
  case
  when num < 0
    '-' + integer_to_string(-num)
  when num == 0
    '0'
  when num > 0
    '+' + integer_to_string(num)
  else
    puts "Bad Input."
  end
end


p [signed_integer_to_string(4321) == '+4321',
  signed_integer_to_string(-123) == '-123',
  signed_integer_to_string(0) == '0']

# Further Exploration

# Refactor our solution to reduce the 3 integer_to_string calls to just one.

# Solution: using the suffix string variable

def signed_integer_to_string_2(number)
  case number <=> 0
  when -1
    suff = '-'
    number = -number
  when +1
    suff = '+'
  else
    suff = ''
  end
  suff + integer_to_string(number)
end

puts
p [signed_integer_to_string_2(4321) == '+4321',
  signed_integer_to_string_2(-123) == '-123',
  signed_integer_to_string_2(0) == '0']
