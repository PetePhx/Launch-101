def tip_calculator
  puts "What is the bill?"
  bill = gets.chomp.to_f
  puts "What is the tip percentage?"
  percent = gets.chomp.to_f / 100

  tip = bill * percent
  total = bill + tip

  puts "The tip is $#{format("%2.2f",tip)}."
  puts "The total is $#{format("%2.2f",total)}."
end

tip_calculator

# Further Exploration:
# Since we used the format("%2.2f", ...) method above, the displayed format is
# correct. HAd we used round(2), it would only show one decimal places for
# values ending in a 0 digit
