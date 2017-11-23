def greeting
  puts "What is your name?"
  name = gets.chomp
  if name[-1] == '!'
    name = name[0..-2].upcase!
    puts "HELLO #{name}. WHY ARE WE SCREAMING?"
  else
    puts "hello #{name}."
  end
end

greeting()

# or we could use the #chop or #chop! methods to get rid of the last character.
# Further Exploration: using #chomp! and #chop!

puts
def greeting_exploratory
  puts "What is your name?"
  name = gets.chomp!
  if name[-1] == '!'
    name.chop!.upcase!
    puts "HELLO #{name}. WHY ARE WE SCREAMING?"
  else
    puts "hello #{name}."
  end
end

greeting_exploratory()
