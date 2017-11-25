def arithmetic_integer
  puts "==> Enter the first number:"
  num_1 = gets.chomp
  puts "==> Enter the second number:"
  num_2 = gets.chomp

  ops = %w( + - * / % ** )
  puts
  ops.each do |op|
    puts "==> #{num_1} #{op} #{num_2} = #{eval(num_1 + op + num_2)}"
  end
end

arithmetic_integer

# if we wanted to avoid using eval, we could use #send method in line 10:
# puts "==> #{num_1} #{op} #{num_2} = #{num_1.to_i.send(op.to_sym, num_2.to_i)}"

# IF we wanted to use floats, we could not use the % operation. other operations
# are still well defined. 
