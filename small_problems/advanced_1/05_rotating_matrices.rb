=begin
A 90 degree rotation of a non-square matrix is similar. For example, the
rotation of:

3  4  1
9  7  5

is:

9  3
7  4
5  1

Write a method that takes an arbitrary matrix and rotates it 90 degrees
clockwise as shown above.

=end

# since we have transpose from the previous exercises:

def rotate90(matrix)
  matrix.transpose.map(&:reverse)
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

=begin

Further Exploration

Can you modify your solution to perform 90, 180, 270, and 360 degree rotations
based on an argument?
=end

def rotate180(matrix)
  matrix.reverse.map(&:reverse)
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix1 = rotate180(matrix1)
puts
p new_matrix1 == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]

def rotate270(matrix)
  matrix.map(&:reverse).transpose
end

matrix1 = [
  [1, 5, 8],
p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix1 = rotate270(matrix1)

p new_matrix1 == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]

def rotate360(matrix)
  matrix
end
