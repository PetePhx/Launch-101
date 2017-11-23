# As in the previous problem:

(1..99).each { |num| puts(num) if num.even? }

# or using Range#step methods

(2..99).step(2).each {|num| puts num} 
