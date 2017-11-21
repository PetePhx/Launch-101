VALID_CHOICES = %w(rock paper scissors spock lizard)

LETTERS_HASH = { r: "rock", p: "paper", s: "scissors",
                 k: "spock", l: "lizard" }

CHOICE_HASH = { rock: 0, paper: 1, scissors: 2, spock: 3, lizard: 4 }

def prompt(message)
  Kernel.puts("=>#{message}")
end

# num1 overcomes num2 if the difference is odd in mod 5 :)
def overcome?(num1, num2)
  ((num1 - num2) % 5).odd?
end

def win?(first, second)
  overcome?(CHOICE_HASH[first.to_sym], CHOICE_HASH[second.to_sym])
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("it's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')},")
    prompt("or R/P/S/K/L, for Rock/Paper/Scissors/spocK/Lizard, respectively.")
    choice = Kernel.gets().chomp().downcase

    if VALID_CHOICES.include?(choice)
      break
    elsif LETTERS_HASH.key?(choice.to_sym)
      choice = LETTERS_HASH[choice.to_sym]
      break
    else
      prompt("Thant's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
