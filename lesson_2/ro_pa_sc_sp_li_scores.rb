VALID_CHOICES = %w(rock paper scissors spock lizard)

LETTERS_HASH = { r: "rock", p: "paper", s: "scissors",
                 k: "spock", l: "lizard" }

CHOICE_HASH = { rock: 0, paper: 1, scissors: 2, spock: 3, lizard: 4 }

def prompt(message)
  Kernel.puts("=>#{message}")
end

# num1 wins over num2 if the difference is odd in mod 5 :)
def winning_diff?(num1, num2)
  ((num1 - num2) % 5).odd?
end

def win?(first, second)
  winning_diff?(CHOICE_HASH[first.to_sym], CHOICE_HASH[second.to_sym])
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("Computer won this round!")
  else
    prompt("it's a tie!")
  end
end

def update_results(player, computer, scores)
  if win?(player, computer)
    scores[:player] += 1
  elsif win?(computer, player)
    scores[:computer] += 1
  end
end

def display_scores(scores)
  prompt("--------------------------------------------")
  prompt("-------------- Current Scores --------------")
  prompt("--------------------------------------------")
  prompt("---------- You: #{scores[:player]} --- Computer: #{scores[:computer]} ----------")
  prompt("--------------------------------------------")
end

def display_final(scores)
  if scores[:player] == 5
    prompt("YOU WON!")
  elsif scores[:computer] == 5
    prompt("YOU LOST!")
  else
    prompt("Beep Beep Boop... something went wrong! bye!")
  end
end

system("clear") || system('cls')
prompt("Welcome to Rock-Paper-Scissors-Spock-Lizard!")
puts
prompt("
  ========================== R U L E S ==========================

  SCISSORS cuts PAPER covers ROCK crushes LIZZARD poisons SPOCK
  smashes SCISSORS decapitates LIZZARD eats PAPER disproves
  SPOCK vaporizes ROCK crushes SCISSORS!

  The player who first reaches FIVE wins!

  ===============================================================

  ")

loop do
  scores = { player: 0, computer: 0 }
  until (scores[:player] >= 5) || (scores[:computer] >= 5)
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')},")
      prompt("or choose one of r/p/s/k/l for \
(R)ock/(P)aper/(S)cissors/spoc(K)/(L)izard, respectively.")
      choice = Kernel.gets().chomp().downcase

      break if VALID_CHOICES.include?(choice)

      if LETTERS_HASH.key?(choice.to_sym)
        choice = LETTERS_HASH[choice.to_sym]
        break
      else
        prompt("Thant's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample()
    system("clear") || system('cls')
    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")
    display_results(choice, computer_choice)
    update_results(choice, computer_choice, scores)
    display_scores(scores)
  end

  display_final(scores)
  prompt("Do you want to play again? enter 'y' for yes. \
Enter any other key to exit.")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

puts("*** Thank you for playing. Goodbye! ***")
