# Triangle Sides

# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or
# :invalid depending on whether the triangle is equilateral, isosceles, scalene,
# or invalid.

def triangle(a, b, c)
  sides = [a, b, c].sort
  return :invalid if (sides[0] <= 0) || (sides[0] + sides[1] <= sides[2])
  return :equilateral if sides[0] == sides[2]
  return :isosceles if sides[0] == sides[1] || sides[1] == sides[2]
  :scalene
end

p [
  triangle(3, 3, 3) == :equilateral,
  triangle(3, 3, 1.5) == :isosceles,
  triangle(3, 4, 5) == :scalene,
  triangle(0, 3, 3) == :invalid,
  triangle(3, 1, 1) == :invalid
]
