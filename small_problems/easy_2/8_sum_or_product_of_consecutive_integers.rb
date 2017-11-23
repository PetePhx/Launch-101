def sum_or_product

  num = nil
  loop do
    puts ">> Please enter an integer greater than 0:"
    num = gets.chomp.to_i
    if num > 0
      break
    else
      puts ">> Only positive integers are accepted. Let's try again!"
    end
  end

  choice = nil
  loop do
    puts ">> Enter 's' to compute the sum, 'p' to compute the product."
    choice = gets.chomp
    if %w(s p).include? choice
      break
    else
      puts ">> Please choose only (s)um or (p)roduct. OKAY??? :)"
    end
  end

  case choice
  when 's'
    sum = (1..num).reduce(:+)
    puts "The sum of the integers between 1 and #{num} is #{sum}."
  when 'p'
    product = (1..num).reduce(:*)
    puts "The product of the integers between 1 and #{num} is #{product}."
  else
    puts "Hmm... something went wrong! Our engineers are working to fix the \
problem. Try in 10 minutes. See ya!"
  end

puts ">> GOODBYE! <<"
end

sum_or_product

# Further exploration: We used the #reduce method, which is equivalent to
# #inject.
