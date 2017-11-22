dollar_greet = <<-DLR
====================================================
      ▄            ▄            ▄            ▄
 ▄▄▄▄█░█▄▄▄▄  ▄▄▄▄█░█▄▄▄▄  ▄▄▄▄█░█▄▄▄▄  ▄▄▄▄█░█▄▄▄▄
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
▐░█▀▀█░█▀▀▀▀ ▐░█▀▀█░█▀▀▀▀ ▐░█▀▀█░█▀▀▀▀ ▐░█▀▀█░█▀▀▀▀
▐░█▄▄█░█▄▄▄▄ ▐░█▄▄█░█▄▄▄▄ ▐░█▄▄█░█▄▄▄▄ ▐░█▄▄█░█▄▄▄▄
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
 ▀▀▀▀█░█▀▀█░▌ ▀▀▀▀█░█▀▀█░▌ ▀▀▀▀█░█▀▀█░▌ ▀▀▀▀█░█▀▀█░▌
 ▄▄▄▄█░█▄▄█░▌ ▄▄▄▄█░█▄▄█░▌ ▄▄▄▄█░█▄▄█░▌ ▄▄▄▄█░█▄▄█░▌
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
 ▀▀▀▀█░█▀▀▀▀  ▀▀▀▀█░█▀▀▀▀  ▀▀▀▀█░█▀▀▀▀  ▀▀▀▀█░█▀▀▀▀
      ▀            ▀            ▀            ▀
====================================================

DLR

# The Provided Formula. The monthly interest (interest_mon) should be
# strictly positive. Zero interest results in 0.0 / 0.0, or NaN
def monthly_mortgage(loan, monthly_interest, duration_in_months)
  loan * monthly_interest /
    (1 - (1 + monthly_interest)**(-1 * duration_in_months))
end

def mortgage(loan, ann_percent_rate, duration_in_years)
  monthly_interest = (ann_percent_rate / 100.0 ) / 12.0
  duration_in_months = duration_in_years * 12

  monthly_mortgage(loan, monthly_interest, duration_in_months)
end

system("clear") || system("cls")
puts dollar_greet
puts "\nWelcome to the Mortgage Calculator App!"

# main loop
loop do
  puts "\nPlease enter the dollar amount of \
the loan, (e.g. 100000 for $100,000.00):"

  loan = 0
  loop do
    loan = gets.chomp.to_f
    if loan <= 0
      puts "Please enter a positive number!"
    else
      break
    end
  end

  ann_percent_rate = 0
  puts "Enter Annual Percentage Rate or APR (e.g. 5 for a 5% APR):"
  loop do
    ann_percent_rate = gets.chomp.to_f
    if ann_percent_rate <= 0
      puts "Please enter a positive number for Annual Percentage Rate!"
    else
      break
    end
  end

  duration_yr = 0
  puts "Enter loan duration in years:"
  loop do
    duration_yr = gets.chomp.to_f
    if duration_yr <= 0
      puts "Please enter a positive number for the loan duration!"
    else
      break
    end
  end

  monthly_pay = mortgage(loan, ann_percent_rate, duration_yr)

  puts "\nYour monthly payments will be: \
#{format('%02.2f', monthly_pay)} dollars per month."

  puts "\nIt will be paid off in #{12 * duration_yr} months, \
or #{format('%02.2f', duration_yr)} year(s)."

  puts "\nYour total payments (principal plus interest) will be: \
#{format('%02.2f', monthly_pay * 12 * duration_yr)} dollars."

  puts "\nWould you like to do another mortgage calculation? \
(Enter 'y' for yes; enter any other key to exit.)"

  answer = Kernel.gets().chomp()
  if answer.downcase().start_with?('y')
    system("clear") || system("cls")
  else
    break
  end
end

puts "\nThank you and Goodbye!"
