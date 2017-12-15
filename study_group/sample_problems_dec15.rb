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
