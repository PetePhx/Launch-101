require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delim = ', ', word = 'or')
  case arr.size
  when 0 then return ''
  when 1 then return arr[0].to_s
  when 2 then return arr.join(" #{word} ")
  else
    arr[0..-2].join(delim) + delim + word + ' ' + arr[-1].to_s
  end
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
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
  prompt "Welcome to Tic-Tac-Toe!"
  prompt ""
  prompt "* * * * * * * * * * * R U L E S * * * * * * * * * * * *"
  prompt "*                                                     *"
  prompt "* Try to get three X's in a line: row/column/diagonal *"
  prompt "*                                                     *"
  prompt "* First one who wins five rounds wins the game!  :)   *"
  prompt "*                                                     *"
  prompt "* * * * * * * * * * * * * * * * * * * * * * * * * * * *"
  prompt ""
  prompt "Enter any key to begin..."
  gets
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice!"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
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

display_welcome
loop do
  scores = { Player: 0, Computer: 0 }

  loop do
    board = initialize_board

    loop do
      display_board(board)
      display_scores(scores)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    if someone_won?(board)
      scores[detect_winner(board).to_sym] += 1
      prompt "#{detect_winner(board)} won this round!"
    else
      prompt "It's a tie!"
    end
    display_scores(scores)
    break if scores.values.any? {|score| score >= 5}
    prompt "Enter any key for the next round..."
    gets
  end
  prompt "* * * #{scores.key(5)} is also the winner! * * *"
  prompt ""
  prompt "Play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tictactoe. Goodbye!"
