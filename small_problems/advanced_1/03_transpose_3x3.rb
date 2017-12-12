# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
# the transpose of the original matrix. Note that there is a Array#transpose
# method that does this -- you may not use it for this exercise. You also are
# not allowed to use the Matrix class from the standard library. Your task is to
# do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and
# leave the original matrix unchanged.

def transpose(matrix)
  new_mat = [[0] * 3] + [[0] * 3] + [[0] * 3]
  0.upto(2) do |idx_i|
    0.upto(2) do |idx_j|
      new_mat[idx_i][idx_j] = matrix[idx_j][idx_i]
    end
  end
  new_mat
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further Exploration

# Write a transpose! method that transposes a matrix in place. The obvious
# solution is to reuse transpose from above, then copy the results back into
# the array specified by the argument. For this method, don't use this approach;
# write a method from scratch that does the in-place transpose.

=begin
  -input : 3x3 matrix
  -output : same matrix, transposed in place
  algorithm: swap upper-right elements with lower-left elements
    index i : 0 to 2
    index j : i to 2
    swap matrix[i][j] with matrix[j][i]
=end

def transpose!(mat)
  0.upto(2) do |i|
    (i + 1).upto(2) do |j|
      mat[i][j], mat[j][i] = mat[j][i], mat[i][j]
    end
  end
  mat
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
