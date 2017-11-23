def stringy num
  half, remainder = num.divmod 2
  '10' * half + '1' * remainder
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts
# with the extra option
def stringy_hightech(num, zero_start=1)
  half, remainder = num.divmod 2

  case zero_start
  when 0 then '01' * half + '0' * remainder
  when 1 then '10' * half + '1' * remainder
  end
end

puts stringy_hightech(6) == '101010'
puts stringy_hightech(9, 1) == '101010101'
puts stringy_hightech(4, 0) == '0101'
puts stringy_hightech(7, 0) == '0101010'
