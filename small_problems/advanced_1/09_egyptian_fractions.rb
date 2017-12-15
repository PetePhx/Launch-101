=begin

Every positive rational number can be written as an Egyptian fraction. For
example:

    1   1   1   1
2 = - + - + - + -
    1   2   3   6

Write two methods: one that takes a Rational number as an argument, and returns
an Array of the denominators that are part of an Egyptian Fraction
representation of the number, and another that takes an Array of numbers in the
same format, and calculates the resulting Rational number. You will need to use
the Rational class provided by Ruby.

=end

=begin
- egyptian
- input : rational number: Rational object
-output : array of denominators, representing the egyptian fractions
- algorithm:
    - initialize output array to []
    - initialize sum to 0
    - loop over positive integers
      - in each round, check if integer can be added to output array
        - condition: sum less than or equal to number
      - break if sum == number
    - return array

-unegyptian:
  - return the sum of 1/(array element)'s
=end

def egyptian(num)
  out_arr = []
  sum = 0
  count = 1
  while sum < num
    if sum + Rational(1, count) <= num
      out_arr << count
      sum += Rational(1, count)
    end
    break  if sum == num
    count += 1
  end
  out_arr
end

def unegyptian(arr)
  arr.reduce(0) {|sum, elm| sum + Rational(1, elm)}
end

p egyptian(Rational(3, 1))
p unegyptian([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960])
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
