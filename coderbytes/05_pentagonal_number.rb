=begin
Challenge
Using the Ruby language, have the function PentagonalNumber(num) read num which
will be a positive integer and determine how many dots exist in a pentagonal
shape around a center dot on the Nth iteration. For example, in the image below
you can see that on the first iteration there is only a single dot, on the
second iteration there are 6 dots, on the third there are 16 dots, and on the
fourth there are 31 dots.

(shapes: https://coderbyte.com/editor/guest:Pentagonal%20Number:Ruby)

Your program should return the number of dots that exist in the whole pentagon
on the Nth iteration.
=end

def pentagonal_number(num)
  1 + 1.upto(num - 1).map { |elm| elm * 5}.reduce(:+)
end

p pentagonal_number(2) == 6
p pentagonal_number(5) == 51
