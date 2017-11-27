# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.

def character_to_digit char
  case char
  when '0' then 0
  when '1' then 1
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  else
    puts "character #{char} is not a digit. delete system32.exe to continue."
  end
end

puts character_to_digit('5')

def string_to_integer str
  ten_powers = (0..str.length-1).map {|n| 10**n}
  digits_arr = str.reverse.chars.map {|chr| character_to_digit chr}

  number = 0
  digits_arr.each_with_index do |digit, idx|
    number += digit * ten_powers[idx]
  end
  number
end

p [string_to_integer('4321') == 4321,
   string_to_integer('570') == 570]


# A more idiomatic way is to use a hash instead of character_to_digit method:

DIGITS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
            '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

# And use the hash within the method:

def string_to_integer_2 str
  digits_arr = str.reverse.chars.map {|chr| DIGITS[chr]}

  number = 0
  digits_arr.each_with_index do |digit, idx|
    number += digit * 10**idx
  end
  number
end

puts
p [string_to_integer_2('4321') == 4321,
   string_to_integer_2('570') == 570]


# Further Exploration

# Write a hexadecimal_to_integer method that converts a string representing a
# hexadecimal number to its integer value.

HEXDIGITS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
            '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
            'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15}

def hexadecimal_to_integer str
  digits_arr = str.reverse.downcase.chars.map {|chr| HEXDIGITS[chr]}

  number = 0
  digits_arr.each_with_index do |digit, idx|
    number += digit * 16**idx
  end
  number
end

puts 
p hexadecimal_to_integer('4D9f') == 19871
