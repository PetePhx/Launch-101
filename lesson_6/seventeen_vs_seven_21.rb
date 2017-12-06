SUITS = ['♥', '♦', '♣', '♠']
RANKS = ['Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten',
         'Jack', 'Queen', 'King', 'Ace']

VALUES = { Two: 2, Three: 3, Four: 4, Five: 5, Six: 6, Seven: 7, Eight: 8,
           Nine: 9, Ten: 10, Jack: 10, Queen: 10, King: 10, Ace: 11 }

WIN_THRESHOLD = 21
DEALER_THRESHOLD = 17

def initialize_deck(deck)
  SUITS.each do |suit|
    RANKS.each do |rank|
      card = { rank: rank, suit: suit }
      deck << card
    end
  end
  deck.shuffle!
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

def who_won(player_cards, dealer_cards)
  player_hand = hand_value(player_cards)
  dealer_hand = hand_value(dealer_cards)
  return 'dealer' if busted?(player_cards)
  return 'player' if busted?(dealer_cards)
  return 'player' if player_hand > dealer_hand
  return 'dealer' if dealer_hand > player_hand
  'tie'
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

player_cards = [ {rank: 'Ten', suit: '♠'}, {rank: 'Seven', suit: '♠'} ]
dealer_cards = [ {rank: 'Seven', suit: '♠'}, {rank: '???', suit: '???'} ]

display_odds(player_cards, dealer_cards)
