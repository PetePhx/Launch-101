=begin
Given an array of positive or negative integers

I= [i1,..,in]

you have to produce a sorted array P of the form

[ [p, sum of all ij of I for which p is a prime factor (p positive) of ij] ...]

P will be sorted by increasing order of the prime numbers. The final result has to be given as a string in Java, C# or C++ and as an array of arrays in other languages.

Example:

I = [12, 15] # result = [[2, 12], [3, 27], [5, 15]]

[2, 3, 5] is the list of all prime factors of the elements of I, hence the result.

Notes: It can happen that a sum is 0 if some numbers are negative!
=end

=begin
- input: array of integers
- output: array of arrays: [ [p, sum_p], ... ]
- rules:
    - first element of each array: prime number present in at least one of the numbers
    - second element: sum of numbers divisible by the prime
    - subarrays are sorted by the prime number
    - sum can be 0 or negative (negative input ints)
- algorithm:
  - for each number, find the set of prime factors => prime_factors method
  - make an array of all primes, sorted
  - initialize empty output array
  - for each prime in set, find numbers divisible, sum them
  - add [p, sum_p]  to the output array
  -return output array
=end

require 'prime'

# not good naming. provided by codewars
def sumOfDivided(in_arr)
  p_arr = in_arr.each_with_object([]) do |num, arr| # get an array of all primes
    arr << num.abs.prime_division.transpose[0]
  end.flatten.uniq.sort # flat array, unique primes, sort in increasing order
  out_arr = p_arr.each_with_object([]) do |p_num, arr|
    p_sum = in_arr.select { |num| num % p_num == 0 }.reduce(0, :+)
    arr << [p_num, p_sum]
  end
end

p sumOfDivided([5, 15, -30])
p sumOfDivided([12, 15]) == [ [2, 12], [3, 27], [5, 15] ]
