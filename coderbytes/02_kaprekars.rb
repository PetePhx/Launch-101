=begin
Challenge

Using the Ruby language, have the function KaprekarsConstant(num) take the num
parameter being passed which will be a 4-digit number with at least two distinct
digits. Your program should perform the following routine on the number: Arrange
the digits in descending order and in ascending order (adding zeroes to fit it to
a 4-digit number), and subtract the smaller number from the bigger number. Then
repeat the previous step. Performing this routine will always cause you to reach
a fixed number: 6174. Then performing the routine on 6174 will always give you
6174 (7641 - 1467 = 6174). Your program should return the number of times this
routine must be performed until 6174 is reached. For example: if num is 3524
your program should return 3 because of the following steps: (1) 5432 - 2345 =
3087, (2) 8730 - 0378 = 8352, (3) 8532 - 2358 = 6174.

Hard challenges are worth 15 points and you are not timed for them.

=end

=begin
-input: integer. at least 2 distinct digits
-output: integer. number of rounds needed to get to kaprekars constant

-algorithm:
  - helper method: the subtraction operation:
        - sort digits in descending and ascending order (padding)
        - subtract from each otherwise
  - main method: perform operation until we get to kaprekars const
  - return the num of rounds

=end

KAPREKARS_CONST = 6174

def subtraction_of_sorts(num)
  arr = num.to_s.chars
  arr << '0' while arr.length < 4
  num_small = arr.sort.join('').to_i
  num_large = arr.sort.reverse.join('').to_i
  num_large - num_small
end

def rounds_to_kaprekars(num)
  round = 0
  until num == KAPREKARS_CONST
    num = subtraction_of_sorts(num)
    round += 1
  end
  return round
end

p rounds_to_kaprekars(3524) == 3
p rounds_to_kaprekars(2111) == 5
p rounds_to_kaprekars(9831) == 7
