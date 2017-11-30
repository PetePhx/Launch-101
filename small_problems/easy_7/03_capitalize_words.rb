# Capitalize Words

# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character of
# every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(str)
  str.split(' ').map(&:capitalize).join(' ')
end

p [
  word_cap('four score and seven') == 'Four Score And Seven',
  word_cap('the javaScript language') == 'The Javascript Language',
  word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
]

# Further Exploration

# Ruby convenient provides the String#capitalize method to capitalize strings.
# Without that method, how would you solve this problem? Try to come up with at
# least two solutions.

def word_cap2(str)
  str.split(' ').map { |wrd| wrd[0].upcase + wrd[1..-1].downcase }.join(' ')
end

p [
  word_cap2('four score and seven') == 'Four Score And Seven',
  word_cap2('the javaScript language') == 'The Javascript Language',
  word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'
]

def word_cap3(str)
  wrd_arr = str.split(' ')
  res_arr = []
  wrd_arr.each_with_index do |wrd, idx|
    res_arr[idx] = wrd[0].upcase
    res_arr[idx] += wrd[1..-1].downcase
  end
  res_arr.join(' ')
end

p [
  word_cap3('four score and seven') == 'Four Score And Seven',
  word_cap3('the javaScript language') == 'The Javascript Language',
  word_cap3('this is a "quoted" word') == 'This Is A "quoted" Word'
]
