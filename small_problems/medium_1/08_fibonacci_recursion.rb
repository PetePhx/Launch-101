# Fibonacci Numbers (Recursion)

# Write a recursive method that computes the nth Fibonacci number, where nth is
# an argument to the method.

def fibonacci(num)
  case num
  when 1 then 1
  when 2 then 1
  else fibonacci(num - 1) + fibonacci(num - 2)
  end
end

p [
  fibonacci(1) == 1,
  fibonacci(2) == 1,
  fibonacci(3) == 2,
  fibonacci(4) == 3,
  fibonacci(5) == 5,
  fibonacci(12) == 144,
  fibonacci(20) == 6765
]
