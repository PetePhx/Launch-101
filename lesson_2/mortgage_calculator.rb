dollar_greet = <<-DLR

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$,,,$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"OOO"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$!OOO!$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$,"OOO",$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$,"OOOOOOO",$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$!"OOOOOOOOOOO"!$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$,"OOOOOOOOOOOOOOO",$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$,1OOOOOOOOOOOOOOOOOOO7,$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$,!OOOOOOOOOOOOOOOOOOOOOO"$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$!OOOOOOOOO/""""'\\OOOOOOOO1$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$"OOOOOOOOOO"$$$$!OOOOOOOO"$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$"OOOOOOOOOOO!$$$",OOOOOOO!$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$",OOOOOOOOOO",$$$"""""""$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$"!OOOOOOOOOOO",$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$",OOOOOOOOOOO",$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$"OOOOOOOOOOOO",$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"!OOOOOOOOOOOO"+$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"==OOOOOOOOOOO,$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$,,,,,,$$$$",OOOOOOOOOO",$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$,"OOOOOO',$$$$",OOOOOOOOO!$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$1OOOOOOOO."~~~"OOOOOOOOOO!$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$!OOOOOOOOOOOOOOOOOOOOOOO1$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$",OOOOOOOOOOOOOOOOOOOOO,"$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$",OOOOOOOOOOOOOOOOOOO!$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$1OOOOOOOOOOOOOOOO,1$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$"~~,OOOOOOOOOO,"$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"""1OOO1"'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$!OOO!$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$,OOO,$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

DLR

def monthly_mortgage(loan, interest_mon, duration_mon)
  loan * (interest_mon / (1 - (1 + interest_mon)**(-1 * duration_mon)))
end

# Explanation: Monthly rate is approximately yearly_rate/12.
# Below if the more accurate formula, i.e. (1+yearly_rate)**(1./12) - 1
def mortgage(loan, ann_percent_rate, duration_yr)
  interest_mon = (1 + ann_percent_rate / 100.0)**(1.0 / 12) - 1
  duration_mon = duration_yr * 12

  monthly_mortgage loan, interest_mon, duration_mon
end

puts dollar_greet

puts "\n\n\n\nWelcome to Your Friendly Neighborhood Mortgage Calculator App! :)"

puts "\nPlease enter the dollar amount of loan, (e.g. 100000 for $100,000.00):"

loan = 0
loop do
  loan = gets.chomp.to_f
  if loan <= 0 then puts "Please enter a positive number!" else break end
end

ann_percent_rate = 0
puts "Enter Annual Percentage Rate or APR (e.g. 5 for a 5% APR):"
loop do
  ann_percent_rate = gets.chomp.to_f
  if ann_percent_rate <= 0
    puts "Please enter a positive number for Annual Percentage Date!"
  else
    break
  end
end

duration_yr = 0
puts "Enter loan duration in years:"
loop do
  duration_yr = gets.chomp.to_f
  if duration_yr <= 0
    puts "Please enter a positive number for loan duration!"
  else
    break
  end
end

monthly_pay = mortgage(loan, ann_percent_rate, duration_yr)
puts "\nYour monthly payments will be:\
 #{format('%02.2f', monthly_pay)} dollars per month. :)"

puts "\nIt will be paid off in #{12 * duration_yr} months,\
 or #{format('%02.2f', duration_yr)} year(s). :)"

puts "\nYour total payments (principal+interest) will be:\
 #{format('%02.2f', monthly_pay * 12 * duration_yr)} dollars. :)"

puts "\nGood Luck with that! :)"
