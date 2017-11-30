# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)

def find_fibonacci_index_by_length(length)
  fib = []
  fib[0..1] = [1, 1]
  idx = 1
  fib_len = fib[idx].to_s.size
  until fib_len >= length
    idx += 1
    fib[idx] = fib[idx - 1] + fib[idx - 2]
    fib_len = fib[idx].to_s.size
  end
  idx + 1
end

p [
  find_fibonacci_index_by_length(2) == 7,
  find_fibonacci_index_by_length(10) == 45,
  find_fibonacci_index_by_length(100) == 476,
  find_fibonacci_index_by_length(1000) == 4782,
  find_fibonacci_index_by_length(10000) == 47847
]
