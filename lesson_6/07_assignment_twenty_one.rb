# 01. Figure out a data structure to contain the "deck" and the "player's cards"
# and "dealer's cards". Maybe a hash? An array? A nested array? Your decision
# will have consequences throughout your code, but don't be afraid of choosing
# the wrong one. Play around with an idea, and see how far you can push it. If
# it doesn't work, back out of it.

# Answer: Since each card carries both values and suit, we could start with
# hashes for cards, and an array of hashes for the deck as well as the dealer
# and the player(s).

SUITS = ['♥', '♦', '♣', '♠']

RANKS = ['Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten',
         'Jack', 'Queen', 'King', 'Ace']

deck = []

SUITS.each do |suit|
  RANKS.each do |rank|
    card = {rank: rank, suit: suit}
    deck << card
  end
end

deck.shuffle!

p deck

# [ {:rank=>"seven", :suit=>"♠"}, {:rank=>"three", :suit=>"♣"}, ... ]

# For the player and dealer, we follow a similar setting:

player_cards = []
2.times { player_cards << deck.pop }

dealer_cards = []
2.times { dealer_cards << deck.pop }

p player_cards
# [{:rank=>"Seven", :suit=>"♣"}, {:rank=>"Ten", :suit=>"♣"}]
p dealer_cards
# [{:rank=>"Four", :suit=>"♥"}, {:rank=>"Five", :suit=>"♦"}]

# ============================================================================ #

# 2: Calculating Aces. Remember that aces can be worth either 1 or 11, depending
# on the context. You should not ask the user what the value of the ace is; your
# program should be able to figure this out automatically.

# staring with a hash of initial values:

VALUES = {Two: 2, Three: 3, Four: 4, Five: 5, Six: 6, Seven: 7, Eight: 8,
          Nine: 9, Ten: 10, Jack: 10, Queen: 10, King: 10, Ace: 11}

def number_of_aces(arr)
  arr.select{|card| card.rank == 'Ace'}.length
end

def hand_value(cards)
  value = cards.reduce(0) { |total, elm| total + VALUES[elm[rank.to_sym]] }
  if value > 21
    num_aces = number_of_aces(cards)
    while (num_aces > 0) && (value > 21)
      num_aces -= 1
      value -= 10
    end
  end
  value
end

# ============================================================================ #

# 3. Player turn. When thinking about how to code up the player's turn, think
# about a loop that keeps asking the player to either "hit" or "stay". Now,
# think about the breaking condition for that loop. When do we stop asking that
# question to the user? Some pseudo-code may help.

def player_turn(player_cards, deck)
  loop do
    puts "Hit or Stay? ('h' to hit, 's' to stay)"
    answer = gets.chomp
    hit(player_cards, deck) if answer.downcase.start_with? 'h'
    break if (answer.downcase.start_with? 's') || (busted?(player_cards))
  end
  puts "You chose to stay!" if answer.downcase.start_with? 's'
  puts "You busted!" if busted?(player_cards)
end

def hit(cards, deck)
  cards << deck.pop
end

def busted?(cards)
  hand_value(cards) > 21
end

# ============================================================================ #
# 4. Dealer turn. The dealer turn will follow a very similar pattern as the
# player turn. Except: the dealer's break condition will occur at the top of the
# "hit or stay" loop. See if you can figure out why that is.

def dealer_turn(dealer_cards, deck)
  loop do
    break if hand_value(dealer_cards) >= 17
    hit(dealer_cards, deck)
  end
end

# ============================================================================ #
# 5. When you display the results, you also need to perform the calculation of
# who won. Having one method that does both the calculation and the display to
# the output makes it hard to reason about. The trick is to create a method that
# only returns the result of the game, and another that only handles displaying
# the result. You want to write methods that only do one thing.

def who_won(player_cards, dealer_cards)
  player_hand = hand_value(player_cards)
  dealer_hand = hand_value(dealer_cards)
  return 'player' if busted?(dealer_cards) || (player_hand > dealer_hand)
  return 'dealer' if busted?(player_cards) || (player_hand < dealer_hand)
  'tie'
end

def display_results(player_cards, dealer_cards)
  case who_won(player_cards, dealer_cards)
  when 'player' then puts 'YOU WON!'
  when 'dealer' then puts 'YOU LOST!'
  when 'tie' then "It's a tie!"
  end
end
