require 'yaml'

CALC_ART = '
=================================================================
 _    _ _____ _     _____ ________  ___ _____     _____ _____
| |  | |  ___| |   /  __ \  _  |  \/  ||  ___|   |_   _|  _  |
| |  | | |__ | |   | /  \/ | | | .  . || |__       | | | | | |
| |/\| |  __|| |   | |   | | | | |\/| ||  __|      | | | | | |
\  /\  / |___| |___| \__/\ \_/ / |  | || |___      | | \ \_/ /
 \/  \/\____/\_____/\____/\___/\_|  |_/\____/      \_/  \___/

                       _____ _   _  _____
                      |_   _| | | ||  ___|
                        | | | |_| || |__
                        | | |  _  ||  __|
                        | | | | | || |___
                        \_/ \_| |_/\____/

 _____   ___   _     _____ _   _ _       ___ _____ ___________ _
/  __ \ / _ \ | |   /  __ \ | | | |     / _ \_   _|  _  | ___ \ |
| /  \// /_\ \| |   | /  \/ | | | |    / /_\ \| | | | | | |_/ / |
| |    |  _  || |   | |   | | | | |    |  _  || | | | | |    /| |
| \__/\| | | || |___| \__/\ |_| | |____| | | || | \ \_/ / |\ \|_|
\____/ \_| |_/\_____/\____/\___/ \____/\_| |_/\_/  \___/\_| \_(_)

=================================================================
'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(num)
  num =~ /\A-?\d*\.?\d+(e-?\d+)?\z/i
end

system("clear")
puts CALC_ART
# run build_config_file_lang.rb to prepare messages.yml.en, etc...
prompt "Please choose languae: \
1: English,  2: Español, 3: Français, 4: Deutsch"

lang =  case gets.chomp
        when "2" then "es"
        when "3" then "fr"
        when "4" then "de"
        else
          "en"
        end

# open the config file corresponding to the language
fname = "messages.yml." + lang
if File.exist? fname
  calc_mesg = YAML.load_file(fname)
else
  puts "Could not find the config file #{fname}
Please run the file build_config_file_lang.rb first!"
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

  prompt(calc_mesg[:op_verbs][operator.to_i - 1] + calc_mesg[:op_status])

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

  prompt "==================================="
  prompt calc_mesg[:result_is] + "     #{result}"
  prompt "==================================="
  prompt calc_mesg[:further_calc]
  answer = Kernel.gets().chomp()
  if answer.downcase().start_with?('y')
    system("clear")
  else
    break
  end
end

prompt calc_mesg[:kthnxbye]
