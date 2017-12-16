=begin
You will have a list of rationals in the form
  [ [numer_1, denom_1] , ... [numer_n, denom_n] ]

  where all numbers are positive ints.

 You have to produce a result in the form:

  [ [N_1, D] ... [N_n, D] ]

  in which D is as small as possible and

N_1/D == numer_1/denom_1 ... N_n/D == numer_n,/denom_n.


example: [[1, 2], [1, 3], [1, 4]] ===>  [[6, 12], [4, 12], [3, 12]]
=end

=begin
-input: array of pairs [ [numer_1, denom_1],...[numer_n, denom_n] ]
-output: array of pairs [ [N_1, D],... [N_n, D] ] all same denominator
-algorithm:
  - initialize a hash
  - for each denominator, get prime factors, powers
  - assign the largest power to each prime key in hash
  - common denominator is the multiplication of all primes with max power
  - calculate new numerators, initialize, add pairs to output array
  - return output array
=end

require 'prime'

def convert_fracts(arr)
  prime_powers = Hash.new(0)
  out_arr = []
  arr.each do |num, denom|
    denom.prime_division.each do |prime, power|
      prime_powers[prime] = power if prime_powers[prime] < power
    end
  end
  gcd = prime_powers.to_a.map { |pr, pw| pr**pw }.reduce(:*)
  out_arr = arr.map { |num, denom| [num * (gcd / denom), gcd]}
end

p convert_fracts([[1, 2], [1, 3], [1, 4]])

# better way is to use #lcm method instead of prime factorization

def convert_fracts2(arr)
  denominator = arr.reduce(1) {|den, pair| den.lcm(pair[1])}
  arr.map { |num, den| [num * (denominator / den), denominator] }
end

p convert_fracts2([[1, 2], [1, 3], [1, 4]])


=begin

# Given an array of numbers find if any 3 numbers inside of the array
# can be multiplied to get the maximum number in the array.
# If the number is used once it can't be used again. If there articletwo same numbers
# then that number can be used 2 times.

# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

=end

=begin

- input: array of numbers
- output: boolean: whether or not the max number can be a product of  numbers
- rules
  - each number only once
  - repeat numbers can be used repeatedly.
  - max num itself can also be used
-algorithm:
  - find the maximum of the array: max_num
  - iterate over array elements: three nested loops
     - calculcate a * b * c, check if equal to max_num: return true
  -return flase
=end

def mult_of_three_nums(arr)
  sz = arr.size
  return false if sz < 3
  max_num = arr.max
  0.upto(sz - 3) do |i|
    (i + 1).upto(sz - 2) do |j|
      (j + 1).upto(sz - 1) do |k|
        return true if arr[i] * arr[j] * arr[k] == max_num
      end
    end
  end
  return false
end

p mult_of_three_nums([1, 2, 3, 4, 5, 6]) == true
p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

def mult_of_three_nums(arr)
  arr.combination(3).to_a.each do |subarr|
    return true if subarr.reduce(:+) == arr.max
  end
  false
end

# Write a function that will return the count of distinct case-insensitive alphabetic
# characters and numeric digits that occur more than once in the input string. The input
# string can be assumed to contain only alphabets (both uppercase and lowercase)
# and numeric digits.
#
# Example
#
# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (bandB)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice

def duplicate_count(str)
  str.chars.select { |chr| str.downcase.count(chr) > 1 }.uniq.size
end

puts
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
