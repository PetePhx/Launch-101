# Write a method that takes a positive integer or zero, and converts it to a
# string representation. (Not using any of the  builtin num_to_str methods.)

CHARS = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
          7 => '7', 8 => '8', 9 => '9'}

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

p [integer_to_string(4321) == '4321',
  integer_to_string(0) == '0',
  integer_to_string(5000) == '5000']
