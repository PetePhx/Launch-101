=begin
Challenge
Using the Ruby language, have the function ChessboardTraveling(str) read str
which will be a string consisting of the location of a space on a standard 8x8
chess board with no pieces on the board along with another space on the chess
board. The structure of str will be the following: "(x y)(a b)" where (x y)
represents the position you are currently on with x and y ranging from 1 to 8
and (a b) represents some other space on the chess board with a and b also
ranging from 1 to 8 where a > x and b > y. Your program should determine how
many ways there are of traveling from (x y) on the board to (a b) moving only
up and to the right. For example: if str is (1 1)(2 2) then your program should
output 2 because there are only two possible ways to travel from space (1 1) on
a chessboard to space (2 2) while making only moves up and to the right.
=end

=begin
- input: string. "(a b)(x y)"
                 "0123456789"
- output: integer. number of way to go from (a b) to (x y)
- algorithm:
  - extract a, b, x, y
  - test for edge cases, where x < a or y < b
  - calculate number of ups and rights
    - rights: (x - a), ups: (y - b)
    - make an array
  - calculate the number of distinct permutations of the array
  - return
=end

def chessboard_moves(str)
  a, b, x, y = str[1].to_i, str[3].to_i, str[6].to_i, str[8].to_i
  moves_arr = ["right"] * (x - a) + ["up"] * (y - b)
  moves_arr.permutation.to_a.uniq.length
end

p chessboard_moves("(1 1)(2 2)")
