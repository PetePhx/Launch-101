# Letter Counter (Part 2)

# Modify the word_sizes method from the previous exercise to exclude non-
# letters when determining word size. For instance, the length of "it's" is 3,
# not 4.

def word_sizes str
  freq_hash = Hash.new(0)
  str.split(' ').each do |word|
    word_alph = word.gsub(/[^a-z]/i,'')
    freq_hash[word_alph.length] += 1
  end
  freq_hash.sort_by {|key,_| key}.to_h
end

# we could use delete('^A-Za-z') in line 10 instead of gsub

p [
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 },
  word_sizes('Hey diddle diddle, the cat and the fiddle!') == \
  { 3 => 5, 6 => 3 },
  word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 },
  word_sizes('') == {}
  ]
