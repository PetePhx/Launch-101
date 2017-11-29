# ddaaiillyy ddoouubbllee

# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use String#squeeze
# or String#squeeze!.


def crunch str
  str2 = ''
  str.chars.each_with_index do |chr, idx|
    str2 << chr unless chr ==  str[idx + 1]
  end
  str2
end

p [
  crunch('ddaaiillyy ddoouubbllee') == 'daily double',
  crunch('4444abcabccba') == '4abcabcba',
  crunch('ggggggggggggggg') == 'g',
  crunch('a') == 'a',
  crunch('') == ''
  ]

# Trying to use it with #map

def crunch2 str
  str.chars.reject.with_index {|char, idx| char == str[idx + 1] }.join('')
end

p [
  crunch2('ddaaiillyy ddoouubbllee') == 'daily double',
  crunch2('4444abcabccba') == '4abcabcba',
  crunch2('ggggggggggggggg') == 'g',
  crunch2('a') == 'a',
  crunch2('') == ''
  ]

# Further Exploration

# You can solve this problem using regular expressions (see the Regexp module
# documentation). For a fun challenge, give this a try with regular
# expressions. Can you think of other solutions besides regular expressions?

def crunch3 str
  str.gsub(/(.)\1+/,'\1')
end

p [
  crunch3('ddaaiillyy ddoouubbllee') == 'daily double',
  crunch3('4444abcabccba') == '4abcabcba',
  crunch3('ggggggggggggggg') == 'g',
  crunch3('a') == 'a',
  crunch3('') == ''
  ]

# similar to crunch2, we can also use #map.with_index

def crunch4 str
  str.chars.map.with_index {|char, idx| char != str[idx + 1] ? char : ''}.join
end

p [
  crunch4('ddaaiillyy ddoouubbllee') == 'daily double',
  crunch4('4444abcabccba') == '4abcabcba',
  crunch4('ggggggggggggggg') == 'g',
  crunch4('a') == 'a',
  crunch4('') == ''
  ]
