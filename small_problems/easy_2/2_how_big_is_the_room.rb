M2_TO_SQFT = 10.7639

def display_room_area
  puts "Enter the length of the room in meters:"
  length = gets.chomp.to_f
  puts "Enter the width of the room in meters:"
  width = gets.chomp.to_f
  area_m2 = length * width
  area_sqft = area_m2 * M2_TO_SQFT

  puts "The area of the room is #{format("%.2f", area_m2)} \
square meters (#{format("%.2f", area_sqft)} square feet) :)."
end

display_room_area

# Alternatively, we could use float's round(2) to round the areas to two digits
# precision.

# Further Exploration
puts

SQFT_TO_SQINCH = 144
SQFT_TO_SQCM = 929.0304

def display_room_area_2
  puts "Enter the length of the room in feet:"
  length = gets.chomp.to_f
  puts "Enter the width of the room in feet:"
  width = gets.chomp.to_f
  area_sqft = length * width
  area_sqin = area_sqft * SQFT_TO_SQINCH
  area_sqcm = area_sqft * SQFT_TO_SQCM

  puts "The area of the room is #{area_sqft.round(2)} square feet, or \
#{area_sqin.round(2)} square inches, or #{area_sqcm.round(2)} \
square centimeters."
end

display_room_area_2
