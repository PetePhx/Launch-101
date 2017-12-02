# 1. Write a method called joinor that will produce the following result:

# joinor([1, 2])                   # => "1 or 2"
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

# Then, use this method in the TTT game when prompting the user to mark a
# square.

def joinor(arr, delim = ', ', word = 'or')
  case arr.size
  when 0 then return ''
  when 1 then return arr[0].to_s
  when 2 then return arr.join(" #{word} ")
  else
    arr[0..-2].join(delim) + delim + word + ' ' + arr[-1].to_s
  end
end

p [
  joinor([1, 2]) == "1 or 2",
  joinor([1, 2, 3]) == "1, 2, or 3",
  joinor([1, 2, 3], '; ') == "1; 2; or 3",
  joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
]
# [true, true, true, true]

# Updated game: tictactoe_joinor.rb

#

# 2. Keep score

# Keep score of how many times the player and computer each win. Don't use
# global or constant variables. Make it so that the first player to 5 wins the
# game.

# use a hash a for keeping track of scores. display rules and results.
# updated game: tictactoe_rounds.rb



# 3. Computer AI: Defense

# The computer currently picks a square at random. That's not very interesting.
# Let's make the computer defensive minded, so that if there's an immediate
# threat, then it will defend the 3rd square. We'll consider an "immediate
# threat" to be 2 squares marked by the opponent in a row. If there's no
# immediate threat, then it will just pick a random square.

# 

# tictactoe_defensive_ai.rb
