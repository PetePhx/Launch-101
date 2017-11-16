def reverse_words str
  str_arr = str.split(/ /)
  str_arr.map! do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  str_arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Professional') == 'lanoisseforP'

puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'

puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('Launch School') == 'hcnuaL loohcS'

puts reverse_words('Multiple  Spaces    Here')  # => elpitluM  secapS   Here
puts reverse_words('Multiple  Spaces    Here') == 'elpitluM  secapS    Here'
