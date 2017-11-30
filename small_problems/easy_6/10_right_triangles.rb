# Right Triangles

# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the
# triangle (the diagonal side in the images below) should have one end at the
# lower-left of the triangle, and the other end at the upper-right.

def triangle(num)
  (0..num).each do |stars|
    puts ' ' * (num - stars) + '*' * stars
  end
end

triangle(1)
triangle(5)
triangle(10)
triangle(20)

# Further Exploration

# Try modifying your solution so it prints the triangle upside down from its
# current orientation. Try modifying your solution again so that you can
# display the triangle with the right angle at any corner of the grid.

def triangle_upright(num)
  (0..num).each do |spaces|
    puts ' ' * spaces + '*' * (num - spaces)
  end
end

puts
triangle_upright(1)
triangle_upright(5)
triangle_upright(10)
triangle_upright(20)

def triangle_upleft(num)
  (0..num).each do |spaces|
    puts '*' * (num - spaces) + ' ' * spaces
  end
end

puts
triangle_upleft(1)
triangle_upleft(5)
triangle_upleft(10)
triangle_upleft(20)

def triangle_downleft(num)
  (0..num).each do |stars|
    puts '*' * stars + ' ' * (num - stars)
  end
end

puts
triangle_downleft(1)
triangle_downleft(5)
triangle_downleft(10)
triangle_downleft(20)

def triangle_with_dir(num, direction = 'dr')
  case direction
  when 'ur' then triangle_upright(num)
  when 'ul' then triangle_upleft(num)
  when 'dl' then triangle_downleft(num)
  else
    triangle(num)
  end
end

puts
triangle_with_dir(20, 'ur')
triangle_with_dir(20, 'ul')
triangle_with_dir(20, 'dl')
triangle_with_dir(20)
