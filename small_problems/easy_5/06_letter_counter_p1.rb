# Letter Counter (Part 1)

# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes str
  freq_hash = {}
  str.split(' ').each do |word|
    if freq_hash.key? word.length
      freq_hash[word.length] += 1
    else
      freq_hash[word.length] = 1
    end
  end
  freq_hash.sort_by {|key,_| key}.to_h
end

p [
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 },
  word_sizes('Hey diddle diddle, the cat and the fiddle!') == \
  { 3 => 5, 6 => 1, 7 => 2 },
  word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 },
  word_sizes('') == {}
  ]

# we could use freq_hash = Hash.new(0) instead of {}. Then we could increment
# without having to check the key presence with key? in a if clause:

def word_sizes2 str
  freq_hash = Hash.new(0)
  str.split(' ').each { |word| freq_hash[word.length] += 1 }
  freq_hash.sort_by {|key,_| key}.to_h
end

puts
p [
  word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 },
  word_sizes2('Hey diddle diddle, the cat and the fiddle!') == \
  { 3 => 5, 6 => 1, 7 => 2 },
  word_sizes2("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 },
  word_sizes2('') == {}
  ]
