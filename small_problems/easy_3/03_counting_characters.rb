def character_count
  print "Please write word or multiple words: "
  str = gets.chomp

  count = str.split(' ').map {|word| word.length }.reduce(:+)

  puts "there are #{count} characters in \"#{str}\"."
end

character_count


# Better way of doing without using map/reduce: use string#count

def character_count
  print "Please write word or multiple words: "
  str = gets.chomp
  count = str.count{|char| char != ' '}

  puts "there are #{count} characters in \"#{str}\"."
end
