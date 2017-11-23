(1..99).each { |num| puts(num) if num.odd? }

# or using Range#step methods

(1..99).step(2).each {|num| puts num} 
