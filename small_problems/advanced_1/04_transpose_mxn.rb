# Modify your transpose method from the previous exercise so it works with any
# matrix with at least 1 row and 1 column.

=begin
algorithm
  build an initial n x m matrix of zeros
  iterate through indices, then assign old i,j to new j,i
  return
=end

def transpose(matrix)
  new_mat = 1.upto(matrix[0].size).map {|_| [[0] * matrix.size] }
  0.upto(matrix.size - 1) do |i|
      0.upto(matrix[0].size - 1) do |j|
        new_mat[j][i] = matrix[i][j]
      end
  end
  new_mat
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
