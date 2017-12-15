=begin

Seeing Stars

Write a method that displays an 8-pointed star in an nxn grid, where n is an odd
integer that is supplied as an argument to the method. The smallest such star
you need to handle is a 7x7 grid.

=end

=begin
- input: idd integer 7 or latger (num)
- output: print an n x n pattern, 8-pointed star
- algorithm
    - reject numbers not odd or less than 7
    - build the middle line: '*' * num
    - lines initialized to []
    - zero to num/2 - 1, iterate over index (idx)
          line[idx] = '*' + ' ' * idx + '*' + ' ' * idx + '*' (centered)
    - print lines in revese order, print middle line, print lines in order

=end

def star(num)
  return puts "number should be odd and greater than 5" if num.even? || num < 7
  lines = (num/2).times.with_object([]) do |idx, arr|
            arr << (['*'] * 3).join(' ' * idx).center(num)
          end
  puts lines.reverse, ('*' * num), lines
end

star(15)
