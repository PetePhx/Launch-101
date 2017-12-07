# Now I Know My ABCs

# A collection of spelling blocks has two letters per block, as shown in this
# list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used
# once.

# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

ARR1 = %w[X D C N G R F J H V L Z]
ARR2 = %w[K Q P A T E S W U I Y M]

def block_word?(word)
  idx_arr = word.upcase.chars.each_with_object([]) do |chr, arr|
    arr << (ARR1.index(chr) || ARR2.index(chr) || -1) # -1 for missing chars
  end
  !idx_arr.include?(-1) && idx_arr.uniq.length == idx_arr.length
end

p [
  block_word?('BATCH') == false,
  block_word?('BUTCH') == false,
  block_word?('jest') == true,
  block_word?('jerst') == false
]
# [true, true, true, true]

# If the blocks cover the whole alphabet, then we can just use #count

BLOCKS = %w[BO XK DQ CP NA GT RE FS JW HU VI LY ZM].freeze

def block_word_2?(word)
  up_wrd = word.upcase
  BLOCKS.all? { |block| up_wrd.count(block) < 2 }
end

p [
  block_word_2?('BATCH') == true,
  block_word_2?('BUTCH') == false,
  block_word_2?('jest') == true
]
# [true, true, true]
