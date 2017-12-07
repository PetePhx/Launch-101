# Bubble Sort`

# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array passed as an argument. You may
# assume that the Array contains at least 2 elements.

def bubble_sort!(arr)
  more_swaps = true
  while more_swaps
    more_swaps = false
    (0..arr.length - 2).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        more_swaps = true
      end
    end
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w[Sue Pete Alice Tyler Rachel Kim Bonnie]
bubble_sort!(array)
p array == %w[Alice Bonnie Kim Pete Rachel Sue Tyler]

# Further Exploration

# Note that we did not use the optimization suggested on the Wiki page that
# skips looking at tail elements that we know are already sorted. If your
# solution also skipped this optimization, trying modifying your solution so it
# uses that optimization.

# adding the round variable to skip the tail elements in subsequent rounds:

def bubble_sort_2!(arr)
  more_swaps = true
  round = 0
  while more_swaps
    more_swaps = false
    (0..arr.length - 2 - round).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        more_swaps = true
      end
    end
    round += 1
  end
end

array = [5, 3]
bubble_sort_2!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort_2!(array)
p array == [1, 2, 4, 6, 7]

array = %w[Sue Pete Alice Tyler Rachel Kim Bonnie]
bubble_sort_2!(array)
p array == %w[Alice Bonnie Kim Pete Rachel Sue Tyler]
