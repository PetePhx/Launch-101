INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
MARKERS = { Initial: INITIAL_MARKER, Player: PLAYER_MARKER,
            Computer: COMPUTER_MARKER }

FIRST_PLAYER = 'Choose' # either 'PLayer' or 'Computer' or 'Choose'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

BANNER = '
 _______  _           _______                  _______
(_______)(_)         (_______)                (_______)
    _     _   ____       _     _____   ____       _      ___   _____
   | |   | | / ___)     | |   (____ | / ___)     | |    / _ \ | ___ |
   | |   | |( (___      | |   / ___ |( (___      | |   | |_| || ____|
   |_|   |_| \____)     |_|   \_____| \____)     |_|    \___/ |_____)
'

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delim = ', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr[0].to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[0..-2].join(delim) + delim + word + ' ' + arr[-1].to_s
  end
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system("clear") || system("CLS")
  puts "You're '#{PLAYER_MARKER}'. Computer is '#{COMPUTER_MARKER}'."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def display_guide(brd)
  guide_brd = initialize_board
  empty_squares(brd).each { |idx| guide_brd[idx] = idx }
  prompt " #{guide_brd[1]} | #{guide_brd[2]} | #{guide_brd[3]} "
  prompt "---+---+---"
  prompt " #{guide_brd[4]} | #{guide_brd[5]} | #{guide_brd[6]} "
  prompt "---+---+---"
  prompt " #{guide_brd[7]} | #{guide_brd[8]} | #{guide_brd[9]} "
end
# rubocop: enable Metrics/AbcSize

def display_scores(hsh)
  puts "+----------+------------+"
  puts "|  PLAYER  |  COMPUTER  |"
  puts "+----------+------------+"
  puts "|    #{hsh[:Player]}     |     #{hsh[:Computer]}      |"
  puts "+----------+------------+"
  puts
end

def display_welcome
  system("clear") || system("CLS")
  prompt "Welcome to...\n\n\n"
  puts BANNER + "\n"
  prompt "+====================== R U L E S ====================+"
  prompt "|                                                     |"
  prompt "|       Try to get three markers in a sequence:       |"
  prompt "|                                                     |"
  prompt "|               row / column / diagonal               |"
  prompt "|                                                     |"
  prompt "| First one who wins FIVE rounds wins the game!  :)   |"
  prompt "|                                                     |"
  prompt "+=====================================================+"
  prompt ""
end

def prompt_user_to_choose_first_player
  prompt "Please choose who plays first! player (p) or computer (c):"
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if %w[p player c computer].include?(answer)
    puts "The only choices are player and computer. (p or c)"
  end
  case answer
  when 'p', 'player' then 'Player'
  when 'c', 'computer' then 'Computer'
  end
end

def assign_first_player
  case FIRST_PLAYER
  when 'Player' then 'Player'
  when 'Computer' then 'Computer'
  when 'Choose' then prompt_user_to_choose_first_player
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(brd, current_player)
  case current_player
  when 'Player' then player_places_piece!(brd)
  when 'Computer' then computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  prompt "Choose an available square (#{joinor(empty_squares(brd))}):"
  display_guide(brd)
  loop do
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice!"
    prompt "only: #{joinor(empty_squares(brd))}."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  winning_square = find_winning_square(brd, 'Computer')
  risk_square = find_winning_square(brd, 'Player')
  square = if !winning_square.nil?
             winning_square
           elsif !risk_square.nil?
             risk_square
           elsif empty_squares(brd).include? 5
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count('X') == 3
      return 'Player'
    elsif brd.values_at(*line).count('O') == 3
      return 'Computer'
    end
  end
  nil
end

def find_winning_square(brd, contestant) # contestant is 'Player' or 'Computer'
  marker = MARKERS[contestant.to_sym]
  empty_squares(brd).each do |num|
    brd_possible_next = brd.merge({ num => marker })
    return num if detect_winner(brd_possible_next) == contestant
  end
  nil
end

def update_scores(scores, winner)
  scores[winner.to_sym] += 1
end

def alternate_player(current_player)
  case current_player
  when 'Player' then 'Computer'
  when 'Computer' then 'Player'
  end
end

def play_again?
  prompt "Play again? (Enter 'y' for yes -- otherwise exit.)"
  answer = gets.chomp
  answer.downcase.start_with?('y') ? true : false
end

display_welcome
loop do
  scores = { Player: 0, Computer: 0 }
  first_player = assign_first_player

  loop do
    board = initialize_board
    current_player = first_player

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    if someone_won?(board)
      winner = detect_winner(board)
      update_scores(scores, winner)
      prompt "#{winner} won this round!"
    else
      prompt "It's a tie!"
    end
    display_scores(scores)
    break if scores.values.any? { |score| score >= 5 }
    prompt "Hit 'Enter' to start the next round..."
    gets
  end
  prompt "* * * #{scores.key(5)} is also the winner! * * *"
  prompt ""
  break unless play_again?
end
prompt "Thank you for playing tic-tac-toe. Goodbye!"
