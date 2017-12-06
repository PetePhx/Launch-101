# 1000 Lights

# You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches and toggle every one of them. You go back to the beginning, and on
# this second pass, you toggle switches 2, 4, 6, and so on. On the third pass,
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. You
# repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

def lights_switches(n)
  lights_arr = [false] * n
  1.upto(n) do |stp|
    (stp..n).step(stp) do |idx|
      lights_arr[idx - 1] = !lights_arr[idx - 1]
    end
  end
  (1..n).each_with_object([]) do |idx, obj|
     obj << idx if lights_arr[idx - 1]
  end
end

p lights_switches(5)
p lights_switches(10)
p lights_switches(20)
p lights_switches(50)
p lights_switches(1000)

# note: this returns the numbers in the array that have an odd number of
# divisors. Complete squares have an odd number of divisors.
