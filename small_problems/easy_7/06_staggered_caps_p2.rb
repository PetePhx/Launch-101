# Staggered Caps (Part 2)

# Modify the method from the previous exercise so it ignores non-alphabetic

# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.

def staggered_case(str)
  new_str = ''
  to_upcase = true
  str.chars.each do |chr|
    if chr =~ /[a-zA-Z]/
      new_str << (to_upcase ? chr.upcase : chr.downcase)
      to_upcase = !to_upcase
    else
      new_str << chr
    end
  end
  new_str
end

p [
  staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!',
  staggered_case('ALL CAPS') == 'AlL cApS',
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
]

# Further Exploration

# Modify this method so the caller can determine whether non-alphabetic
# characters should be counted when determining the upper/lowercase state. That
# is, you want a method that can perform the same actions that this method
# does, or operates like the previous version.

# Hint: Use a keyword argument.

def staggered_case2(str, start_with = 'upper')
  new_str = ''
  to_upcase = case start_with
              when 'u', 'upper' then true
              when 'l', 'lower' then false
              else
                puts "start_with option #{start_with} is not recognized."
                puts "Choose 'upper' ('u') or 'lower' ('l')."
                return
              end
  str.chars.each do |chr|
    if chr =~ /[a-zA-Z]/
      new_str << (to_upcase ? chr.upcase : chr.downcase)
      to_upcase = !to_upcase
    else
      new_str << chr
    end
  end
  new_str
end

p [
  staggered_case2('I Love Launch School!', 'u') == 'I lOvE lAuNcH sChOoL!',
  staggered_case2('ALL CAPS', 'lower') == 'aLl CaPs',
  staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs',
  staggered_case2('hello', 'hmmm').nil?
]
