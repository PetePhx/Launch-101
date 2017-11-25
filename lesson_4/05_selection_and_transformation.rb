# Let's now take a look at an example with hashes. In this example we want to
# select the key-value pairs where the value is 'Fruit'.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# How would you implement a method like this?

# Answer
# without using methods #key or #select:

def select_fruit produce
  keys = produce.keys
  sub_hash = {}
  keys.each do |k|
    if produce[k] == "Fruit"
      sub_hash[k] = "Fruit"
    end
  end
  sub_hash
end

p select_fruit(produce)
#  => {"apple"=>"Fruit", "pear"=>"Fruit"}

# ============================================================================ #

puts

# If we wanted to, we could've easily decided that mutating the method argument
# is the right approach. Can you implement a double_numbers! method that mutates
 # its argument?

 # Answer:
 # Not using map!, only with loop-do-end and counter, we have:

 def double_numbers!(numbers)

   counter = 0
   loop do
     break if counter >= numbers.length
     numbers[counter] *= 2
     counter += 1
   end
   numbers # not really necessary, but good to have
 end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers)
p my_numbers

# ============================================================================ #

puts
# Try coding a method that allows you to multiply every array item by a
# specified value:

# ANswer: not using #map

def multiply(num_arr, num)
  counter = 0
  new_arr = []
  loop do
    break if counter >= num_arr.length
    new_arr << num_arr[counter] * num
    counter += 1
  end

  new_arr
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
