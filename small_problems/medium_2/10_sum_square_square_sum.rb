# Sum Square - Square Sum

# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.

def sum_square_difference(num)
  1.upto(num).sum**2 - 1.upto(num).reduce(0) { |total, n| total + n**2 }
end

p [
  sum_square_difference(3) == 22,
  sum_square_difference(10) == 2640,
  sum_square_difference(1) == 0,
  sum_square_difference(100) == 25164150
]
