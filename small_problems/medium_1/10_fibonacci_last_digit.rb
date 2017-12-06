# Fibonacci Numbers (Last Digit)

# In this exercise, you are going to compute a method that returns the last
# digit of the nth Fibonacci number.

def fibonacci_last(nth)
  digit1 = 1
  digit2 = 1
  return digit2 if nth <= 2
  3.upto(nth) do
    digit1, digit2 = digit2, (digit1 + digit2) % 10
  end
  digit2
end

p [
  fibonacci_last(15) == 0,
  fibonacci_last(20) == 5,
  fibonacci_last(100) == 5,
  fibonacci_last(100_001) == 1,
  fibonacci_last(1_000_007) == 3,
  fibonacci_last(123456789) == 4
]
# [true, true, true, true, true, true]

# Further Exploration

# After a while, even this method starts to take too long to compute results.
# Can you provide a solution to this problem that will work no matter how big
# the number? You should be able to return results almost instantly. For
# example, the 123,456,789,987,745th Fibonacci number ends in 5.

# By running the code:

(1..100).each do |n|
  print '[', n.to_s, ', ', fibonacci_last(n).to_s, ']', ' '
end

# and looking at the results, we see that the digit sequence is repeating itself
# every 60 rounds:

# [1, 1] [2, 1] ... [60,0], [61, 1] [62, 1] ...

# Therefore in order to calculate the last digit, we only need to calculate the
# number modulus 60, then find the last digit. Taking into account the edge case
# for n % 60 of zero

def fibonacci_last_digit(nth)
  num = nth % 60
  return 0 if num == 0
  fibonacci_last(num)
end

p [
  fibonacci_last_digit(123_456_789_987_745) == 5
]

# We could also use a contant array for digits for even less computation:

puts
(1..60).each do |n|
  print fibonacci_last(n).to_s, ', '
end

FIB_DIGITS = [0, 1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 0, 7, 7, 4, 1,
              5, 6, 1, 7, 8, 5, 3, 8, 1, 9, 0, 9, 9, 8, 7, 5, 2, 7, 9, 6,
              5, 1, 6, 7, 3, 0, 3, 3, 6, 9, 5, 4, 9, 3, 2, 5, 7, 2, 9, 1]

# And simplify the method:

def fibonacci_last_digit2(nth)
  FIB_DIGITS[nth % 60]
end

puts
p [
  fibonacci_last_digit2(123_456_789_987_745) == 5
]
