# Grade book

# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.
# Numerical Score Letter 	Grade
# 90 <= score <= 100 	'A'
# 80 <= score < 90 	'B'
# 70 <= score < 80 	'C'
# 60 <= score < 70 	'D'
# 0 <= score < 60 	'F'

# Tested values are all between 0 and 100. There is no need to check for
# negative values or values greater than 100.

def get_grade(num1, num2, num3)
  avg = (num1 + num2 + num3).fdiv(3)
  if avg >= 90
    return 'A'
  elsif avg >= 80
    return 'B'
  elsif avg >= 70
    return 'C'
  elsif avg >= 60
    return 'D'
  else
    return 'F'
  end
end

p [
  get_grade(95, 90, 93) == "A",
  get_grade(50, 50, 95) == "D"
]

# using case-when-then and range:

def get_grade2(num1, num2, num3)
  case (num1 + num2 + num3).fdiv(3)
  when (90..100) then 'A'
  when (80..90) then 'B'
  when (70..80) then 'C'
  when (60..70) then 'D'
  when (0..60) then 'F'
  end
end

p [
  get_grade2(95, 90, 93) == "A",
  get_grade2(50, 50, 95) == "D"
]
