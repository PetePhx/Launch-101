# Diamonds!

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.

# diamond(3)
#
#  *
# ***
#  *

def diamond(num)
  (1..num).step(2) do |stars|
    spaces = (num - stars) / 2
    puts ' ' * spaces + '*' * stars + ' ' * spaces
  end
  1.upto(num / 2) do |spaces|
    stars = num - 2 * spaces
    puts ' ' * spaces + '*' * stars + ' ' * spaces
  end
end

diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)
diamond(11)
diamond(13)

# Further Exploration
#
# Try modifying your solution or our solution so it prints only the outline of
# the diamond:
#
# diamond(5)
#
#   *
#  * *
# *   *
#  * *
#   *

def print_row(grid_size, dist_from_cen)
  pat_size = grid_size - 2 * dist_from_cen
  pattern = if pat_size == 1
              '*'
            else
              '*' + ' ' * (pat_size - 2) + '*'
            end
  puts pattern.center(grid_size)
end

def hollow_diamond(grid_size)
  max_dist = (grid_size - 1) / 2
  max_dist.downto(0) { |dist| print_row(grid_size, dist) }
  1.upto(max_dist)   { |dist| print_row(grid_size, dist) }
end

hollow_diamond(1)
hollow_diamond(3)
hollow_diamond(5)
hollow_diamond(7)
hollow_diamond(9)
hollow_diamond(11)
