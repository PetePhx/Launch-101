# fizzbuzz

# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".

def fizzbuzz(num1, num2)
  arr = []
  num1.upto(num2) do |num|
    arr << case
           when num % 15 == 0 then 'FizzBuzz'
           when num % 3 == 0 then 'Fizz'
           when num % 5 == 0 then 'Buzz'
           else num.to_s
           end
  end
  puts arr.join(', ')
end

fizzbuzz(1, 15)
# => 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Using each_with_object
def fizzbuzz2(num1, num2)
  puts (num1.upto(num2).each_with_object([]) do |num, arr|
          arr << if num % 15 == 0 then 'FizzBuzz'
                 elsif num % 3 == 0 then 'Fizz'
                 elsif num % 5 == 0 then 'Buzz'
                 else num.to_s
                 end
        end.join(', '))
end

fizzbuzz2(1, 15)

# more succinct version with case

def fizzbuzz3(num1, num2)
  arr = []
  num1.upto(num2) do |num|
    case num % 15
    when 0 then arr << "FizzBuzz"
    when 3, 6, 9, 12 then arr << "Fizz"
    when 5, 10 then arr << "Buzz"
    else arr << num
    end
  end
    puts arr.join(", ")
end

puts
fizzbuzz3(15, 30)
