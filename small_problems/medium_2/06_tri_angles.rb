#  Tri-Angles

# Write a method that takes the 3 angles of a triangle as arguments, and returns
# a symbol :right, :acute, :obtuse, or :invalid depending on whether the
# triangle is a right, acute, obtuse, or invalid triangle.

def triangle(*angles)
  angles.sort!
  return :invalid if angles[0] <= 0 || angles[2] >= 180 || angles.sum != 180
  case angles[2]
  when 90 then :right
  when 90..180 then :obtuse
  else :acute
  end
end

p [
  triangle(60, 70, 50) == :acute,
  triangle(30, 90, 60) == :right,
  triangle(120, 50, 10) == :obtuse,
  triangle(0, 90, 90) == :invalid,
  triangle(50, 50, 50) == :invalid
]
