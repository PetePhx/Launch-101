# Grocery List

# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

def buy_fruit(pairs_arr)
  pairs_arr.map { |str, num| [str] * num }.flatten
end

p [
  buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
]

# using flat_map:

def buy_fruit2(pairs_arr)
  pairs_arr.flat_map { |str, num| [str] * num }
end

p [
  buy_fruit2([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
]
