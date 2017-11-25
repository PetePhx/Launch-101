def searching_101

  nums_arr = []
  label_arr = %w(1st 2nd 3rd 4th 5th last)
  count = 0
  loop do
    break if count > 5
    puts "==> Enter the #{label_arr[count]} number:"
    loop do
      num_str = gets.chomp
      if num_str.to_f.to_s == num_str     # float
        nums_arr << num_str.to_f
        break
      elsif num_str.to_i.to_s == num_str # integer
        nums_arr << num_str.to_i
        break
      else                               # otherwise
        puts 'Please enter only numbers... okay?'
      end
    end
    count += 1
  end

  if nums_arr[0..4].include? nums_arr[5]
    puts "The number #{nums_arr[5]} appears in #{nums_arr[0..4]}."
  else
    puts "The number #{nums_arr[5]} does not appear in #{nums_arr[0..4]}."
  end
end

searching_101
