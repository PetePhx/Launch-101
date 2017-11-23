def retirement_forecast
  puts "What is your age?"
  current_age = gets.chomp.to_i
  puts "At what age would you like to retire?"
  retire_age = gets.chomp.to_i

  time_to_retire = retire_age - current_age
  this_year = Time.new.year
  retire_year = this_year + time_to_retire

  puts "It's #{this_year}. You will retire in #{retire_year}."
  puts "You have only #{time_to_retire} year(s) of work to go!"
end

retirement_forecast
