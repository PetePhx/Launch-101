BANNER = <<-BNR
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥
♣  _____                                      ♦
♠ |A .  | _____                               ♣
♥ | /.\\ ||A ^  | ██████╗  ██   _____          ♠
♦ |(_._)|| / \\ | ╚════██╗███║ |A _  | _____   ♥
♣ |  |  || \\ / |  █████╔╝╚██║ | ( ) ||A_ _ |  ♦
♠ |____V||  .  | ██╔═══╝  ██║ |(_'_)||( v )|  ♣
♥        |____V| ███████╗ ██║ |  |  || \\ / |  ♠
♦                ╚══════╝ ╚═╝ |____V||  .  |  ♥
♣                                    |____V|  ♦
♠                                             ♣
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥

♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥
♦ ♣ ♠                                     ♣ ♠ ♥
♦ ♣         WELCOME TO TWENTY-ONE!          ♠ ♥
♦ ♣ ♠                                     ♣ ♠ ♥
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥\n
BNR
# rubocop: disable Style/LineEndConcatenation
RULES_BANNER = \
  "\n" +
  '♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥    R U L E S    ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♦' + "\n" +
  '♦ ' + ' ' * 43 + ' ♦' + "\n" +
  '♦ ' + 'The goal is to get close to number'.center(43) + ' ♦' + "\n" +
  '♦ ' + '21 without going over, i.e. \'busted\'.'.center(43) + ' ♦' + "\n" +
  '♦ ' + 'Number cards 2 to 10 have face values.'.center(43) + ' ♦' + "\n" +
  '♦ ' + 'Jack/Queen/King each count as 10. Ace '.center(43) + ' ♦' + "\n" +
  '♦ ' + 'counts as 1 or 11, depending on hand.'.center(43) + ' ♦' + "\n" +
  '♦ ' + 'Higher hand wins except when busted.'.center(43) + ' ♦' + "\n" +
  '♦ ' + '"Hit" to get extra card(s). Otherwise'.center(43) + ' ♦' + "\n" +
  '♦ ' + '"Stay". Player who wins five rounds'.center(43) + ' ♦' + "\n" +
  '♦ ' + 'wins the game. Good Luck!'.center(43) + ' ♦' + "\n" +
  '♦ ' + ' ' * 43 + ' ♦' + "\n" +
  '♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♦' + "\n\n"
# rubocop: enable Style/LineEndConcatenation

SMALL_BANNER = "\n♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♦"
WON_BANNER = "\n\n ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ YOU WON! ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥"
LOST_BANNER = "\n\n♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠ YOU LOST! ♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠ ♠"

END_BANNER = '
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥
♦ ♣ ♠                                     ♣ ♠ ♥
♦ ♣   Thank you for playing 21. Goodbye!    ♠ ♥
♦ ♣ ♠                                     ♣ ♠ ♥
♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥
'
SUITS = ['♥', '♦', '♣', '♠']
RANKS = ['Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten',
         'Jack', 'Queen', 'King', 'Ace']

VALUES = { Two: 2, Three: 3, Four: 4, Five: 5, Six: 6, Seven: 7, Eight: 8,
           Nine: 9, Ten: 10, Jack: 10, Queen: 10, King: 10, Ace: 11 }

WIN_THRESHOLD = 21
DEALER_THRESHOLD = 17

def clear_screen
  system('clear') || system('CLS')
end

def initialize_deck(deck)
  SUITS.each do |suit|
    RANKS.each do |rank|
      card = { rank: rank, suit: suit }
      deck << card
    end
  end
  deck.shuffle!
end

def deal_initial_cards(player_cards, dealer_cards, deck)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def card_info(card)
  "#{card[:suit]}:#{card[:rank].upcase}:#{card[:suit]}"
end

def cards_string(cards)
  cards.map { |card| card_info(card) }.join(' and ')
end

def number_of_aces(arr)
  arr.select { |card| card[:rank] == 'Ace' }.length
end

def hand_value(cards)
  value = cards.reduce(0) { |total, card| total + VALUES[card[:rank].to_sym] }
  if value > WIN_THRESHOLD
    num_aces = number_of_aces(cards)
    while (num_aces > 0) && (value > WIN_THRESHOLD)
      num_aces -= 1
      value -= 10
    end
  end
  value
end

def hit(cards, deck)
  cards << deck.pop
end

def busted?(cards)
  hand_value(cards) > WIN_THRESHOLD
end

# rubocop: disable Metrics/AbcSize, Metrics/CyclomaticComplexity
# rubocop: disable Metrics/PerceivedComplexity, Metrics/MethodLength
def player_turn(player_cards, dealer_cards, deck)
  answer = nil
  puts "\nYou have #{cards_string(player_cards)}.\n\
total: #{hand_value(player_cards)}"
  loop do
    puts "\nHit, Stay or Odds?\n\
('h': hit, 's': stay, 'o': odds of win/tie/lose):"
    answer = gets.chomp
    if answer.downcase.start_with? 'h'
      hit(player_cards, deck)
      puts "You have: #{cards_string(player_cards)}.\n\
total: #{hand_value(player_cards)}"
    elsif answer.downcase.start_with? 'o'
      display_odds(player_cards, dealer_cards)
    end
    break if answer.downcase.start_with?('s') || busted?(player_cards)
  end
  puts "You chose to stay!" if answer.downcase.start_with? 's'
  puts "You busted!" if busted?(player_cards)
end
# rubocop: enable Metrics/AbcSize, Metrics/CyclomaticComplexity
# rubocop: enable Metrics/PerceivedComplexity, Metrics/MethodLength

def dealer_turn(dealer_cards, deck)
  loop do
    break if hand_value(dealer_cards) >= DEALER_THRESHOLD
    hit(dealer_cards, deck)
  end
  puts "\nThe dealer has: #{cards_string(dealer_cards)}.\n\
total: #{hand_value(dealer_cards)}"
  puts "The dealer busted!" if busted?(dealer_cards)
end

def who_won(player_cards, dealer_cards)
  player_hand = hand_value(player_cards)
  dealer_hand = hand_value(dealer_cards)
  return 'dealer' if busted?(player_cards)
  return 'player' if busted?(dealer_cards)
  return 'player' if player_hand > dealer_hand
  return 'dealer' if dealer_hand > player_hand
  'tie'
end

def display_round_winner(winner)
  case winner
  when 'player'
    puts "\n" + "YOU WON THIS ROUND! （╯ʘ‿ʘ)╯ ︵ (\\ .o.)/".center(47)
  when 'dealer'
    puts "\n" + " YOU LOST THIS ROUND! (╯°□°)╯ ︵  ┻━┻".center(47)
  when 'tie'
    puts "\n" + "( ⊙﹏⊙) ⌐═╦╦═─  IT IS A TIE!  🔫 (⊙﹏⊙ )".center(47)
  end
end

def display_game_winner(scores)
  case scores.key(5)
  when :player
    puts WON_BANNER
  when :dealer
    puts LOST_BANNER
  end
end

def display_scores(scores)
  puts SMALL_BANNER
  puts "\n" + "SCORES:".center(47) + "\n\n"
  puts "Player: #{scores[:player]}, Dealer: #{scores[:dealer]}".center(47)
  puts SMALL_BANNER
end

def update_scores(scores, winner)
  case winner
  when 'player'
    scores[:player] += 1
  when 'dealer'
    scores[:dealer] += 1
  end
end

# rubocop: disable Metrics/AbcSize
def display_odds(player_cards, dealer_cards)
  puts "Estimating the odds... please wait a few seconds..."
  odds = estimate_odds(player_cards, dealer_cards)
  ["STAY", "HIT"].each_with_index do |choice, idx|
    puts "\n"
    puts "+-----------------------------------------------+"
    puts "|" + "#{choice}:".center(47) + "|"
    puts "+---------------+---------------+---------------+"
    puts "|" + "WIN".center(15) + "|" + "TIE".center(15) + "|" +
         "LOSE".center(15) + "|"
    puts "+---------------+---------------+---------------+"
    puts "|" + "#{odds[idx][0]}%".center(15) + "|" +
         "#{odds[idx][1]}%".center(15) + "|" +
         "#{odds[idx][2]}%".center(15) + "|"
    puts "+---------------+---------------+---------------+"
  end
end

# rubocop: disable Metrics/MethodLength
def estimate_odds(player_cards, dealer_cards)
  odds_acc = [[0, 0, 0], [0, 0, 0]]

  ['stay', 'hit'].each_with_index do |choice, idx|
    10_000.times do
      deck = []
      sim_player_cards = player_cards.dup # simulated
      sim_dealer_cards = [dealer_cards[0]]
      deck = initialize_deck(deck) - sim_player_cards - sim_dealer_cards
      hit(sim_dealer_cards, deck) # for the unknown card
      hit(sim_player_cards, deck) if choice == 'hit'
      loop do
        break if hand_value(sim_dealer_cards) >= DEALER_THRESHOLD
        hit(sim_dealer_cards, deck)
      end
      case who_won(sim_player_cards, sim_dealer_cards)
      when 'player' then odds_acc[idx][0] += 1
      when 'tie' then odds_acc[idx][1] += 1
      when 'dealer' then odds_acc[idx][2] += 1
      end
    end
  end
  odds_acc.map { |arr| arr.map { |elm| elm.fdiv(100) } }
end
# rubocop: enable Metrics/AbcSize
# rubocop: enable Metrics/MethodLength

def play_again?
  puts "\n" + SMALL_BANNER
  puts "\nWould you like to play again?"
  print "('y' for yes; otherwise exit):"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def play_one_round(scores)
  clear_screen
  puts SMALL_BANNER
  deck = []
  player_cards = []
  dealer_cards = []
  initialize_deck(deck)
  deal_initial_cards(player_cards, dealer_cards, deck)
  puts "\nThe dealer has: #{cards_string(dealer_cards[0, 1])} \
and an unknown card."
  puts
  player_turn(player_cards, dealer_cards, deck)
  dealer_turn(dealer_cards, deck) if !busted?(player_cards)
  winner = who_won(player_cards, dealer_cards)
  display_round_winner(winner)
  update_scores(scores, winner)
end

def play_one_game
  scores = { player: 0, dealer: 0 }
  loop do
    play_one_round(scores)
    display_scores(scores)
    break if scores.values.max >= 5
    puts "Hit 'Enter' to sart the next round..."
    gets
  end
  display_game_winner(scores)
end

def play_game
  clear_screen
  puts BANNER
  puts "Hit 'Enter' to see rules..."
  gets
  clear_screen
  puts RULES_BANNER
  puts "Hit 'Enter' to begin playing..."
  gets
  loop do
    play_one_game
    break unless play_again?
  end
  clear_screen
  puts END_BANNER
end

play_game
