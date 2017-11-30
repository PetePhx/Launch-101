# Staggered Caps (Part 1)

# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count
# as characters when switching between upper and lowercase.

def staggered_case(str)
  str.chars.map.with_index \
  { |chr, idx| idx.even? ? chr.upcase : chr.downcase }.join('')
end

p [
  staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!',
  staggered_case('ALL_CAPS') == 'AlL_CaPs',
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
]

# Further Exploration

# Modify this method so the caller can request that the first character be
# downcased rather than upcased? If the first character is downcased, then the
# second character should be upcased, and so on.

# Hint: Use a keyword argument.

def staggered_case2(str, start_with = 'upper')
  case start_with.downcase
  when 'u', 'upper'
    str.chars.map.with_index \
    { |chr, idx| idx.even? ? chr.upcase : chr.downcase }.join('')
  when 'l', 'lower'
    str.chars.map.with_index \
    { |chr, idx| idx.odd? ? chr.upcase : chr.downcase }.join('')
  else
    puts "start_with option #{start_with} is not recognized."
    puts "Choose 'upper' ('u') or 'lower' ('l')."
  end
end

p [
  staggered_case2('I Love Launch School!', 'u') == 'I LoVe lAuNcH ScHoOl!',
  staggered_case2('ALL_CAPS', 'lower') == 'aLl_cApS',
  staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS',
  staggered_case2('Hello', 'whatever').nil?
]
