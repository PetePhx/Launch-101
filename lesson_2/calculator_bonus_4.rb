require 'yaml'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(num)
  num =~ /\A-?\d*\.?\d+(e-?\d+)?\z/i
end

def operation_to_message(op)
  op_str =  case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  op_str
end

# run build_config_file.rb to prepare messages.yml
if File.exist? "messages.yml"
  calc_mesg = YAML.load_file("messages.yml")
else
  puts "Could not find the config file...
Please run the build_config_file.rb first!"
  exit
end

prompt calc_mesg[:welcome]

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?
    prompt calc_mesg[:name_err]
  else
    break
  end
end

prompt calc_mesg[:hi] + "#{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt calc_mesg[:first_num]
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt calc_mesg[:num_err]
    end
  end

  number2 = ''
  loop do
    prompt calc_mesg[:second_num]
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt calc_mesg[:num_err]
    end
  end

  prompt calc_mesg[:op_get]

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt calc_mesg[:op_err]
    end
  end

  prompt(operation_to_message(operator) + calc_mesg[:op_status])

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt calc_mesg[:result_is] + " #{result}"
  prompt calc_mesg[:further_calc]
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt calc_mesg[:kthnxbye]
