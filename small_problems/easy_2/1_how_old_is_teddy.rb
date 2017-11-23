age = (20..200).to_a.sample
puts "Teddy is #{age} years old!"

# Alternatively, we could use rand(20..200)

def print_name_age()
  puts "Please enter name:"
  name = gets.chomp
  name = "Teddy" if name == ''
  age = rand(20..200)
  puts "#{name} is #{age} years old!!!"
end

print_name_age
print_name_age
print_name_age
