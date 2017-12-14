=begin
Challenge

Using the Ruby language, have the function MaximalSquare(strArr) take the strArr
parameter being passed which will be a 2D matrix of 0 and 1's, and determine the
area of the largest square submatrix that contains all 1's. A square submatrix
is one of equal width and height, and your program should return the area of the
largest submatrix that contains only 1's. For example: if strArr is ["10100",
"10111", "11111", "10010"] then this looks like the following matrix:

1 0 1 0 0
1 0 1 1 1
1 1 1 1 1
1 0 0 1 0

For the input above, you can see the bolded 1's create the largest square
submatrix of size 2x2, so your program should return the area which is 4. You
can assume the input will not be empty.
=end

=begin
-input: m x n matrix
-output: integer: maximal square submatrix size (all 1)
- algorithm:
  - helper method: check_square, to check for existence of k x k submatrix of 1
    - convert to boolean
    - elementwise && of k rows, look for k consequtive true's
  - main method:
    - find the minimum of m and n
    - initialize count : 0
    - iterate k: 0 through min(m,n)
      - check for existence of k x k submatrix using check_square
        - if not, break
      - increment count
    - return count
=end

def mat_to_bool(matrix)
  matrix.map { |arr| arr.map { |elm| elm == 1 ? true : false } }
end

# p mat_to_bool([[1, 0], [0, 1]])

def check_square(matrix, sq_sz)
  return false if matrix.first.nil? || sq_sz > [matrix.size, matrix[0].size].max
  sz = [matrix.size, matrix.first.size].min
  mat_bl = mat_to_bool(matrix)

  0.upto(sz - sq_sz) do |idx|
    arr_bl = mat_bl[idx...(idx + sq_sz)].transpose.map{ |arr| arr.reduce(:&) }
    0.upto(arr_bl.size - sq_sz) do |id_ar|
      return true if arr_bl[id_ar...(id_ar + sq_sz)].reduce(:&)
    end
  end
  return false
end

# p check_square([[0,1,1], [1,1,1], [1,1,1]], 2)

def maximal_square(matrix)
  return 0 if matrix.first.nil?
  sz = [matrix.size, matrix.first.size].min
  count = 0
  1.upto(sz) do |sq_sz|
    check_square(matrix, sq_sz) ? count = sq_sz : break
  end
  count
end

p maximal_square([[0,1,1], [1,1,1], [1,1,1]]) == 2
p maximal_square([[1,1,1], [1,1,1], [1,1,1]]) == 3
p maximal_square([[0,1,0], [1,0,1], [1,1,1]]) == 1
p maximal_square([[0,0,0], [0,0,0], [0,0,0]]) == 0
