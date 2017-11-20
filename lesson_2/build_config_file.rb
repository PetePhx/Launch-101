require 'yaml'

opget = <<-MSG
What operation would you like to perform?
1) add
2) subtract
3) multiply
4) divide
MSG

calc_mesg = { welcome: "Welcome to Calculator! Enter your name:",
              hi: "Hi ",
              name_err: "Make sure to use a valid name.",
              first_num: "What's the first number?",
              num_err: "That doesn't look like a valid number",
              second_num: "What's the second number?",
              op_get: opget,
              op_err: "Must choose 1, 2, 3, or 4.",
              op_status: " the two numbers...",
              result_is: "The result is: ",
              further_calc:
              "Do you want to perform another calculation? \
              (Y to calculate again)",
              kthnxbye: "Thank you for using the calculator. Goodbye!" }

if File.exist?("messages.yml")
  puts "You are about to rewrite the file \"messages.yml\"?"
  puts "Are you sure? Choose VERY carefully my friend... (Y/N)"
  exit unless gets.chomp.upcase.start_with? "Y"
end

File.open("messages.yml", "w") { |f| f.write(calc_mesg.to_yaml) }
puts "All Done! :)\n"

# To read the messages:
# calc_mesg2 = YAML.load_file("messages.yml")
# puts calc_mesg2
