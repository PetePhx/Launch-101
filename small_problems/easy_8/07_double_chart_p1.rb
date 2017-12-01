# Double Char (Part 1)

# Write a method that takes a string, and returns a new string in which every
# character is doubled.

def repeater(str)
  arr = str.chars
  arr.zip(arr).flatten.join('')
end

p [
  repeater('Hello') == "HHeelllloo",
  repeater("Good job!") == "GGoooodd  jjoobb!!",
  repeater('') == ''
]

# using map:
def repeater2(str)
  str.chars.map { |chr| chr + chr }.join('')
end

p [
  repeater2('Hello') == "HHeelllloo",
  repeater2("Good job!") == "GGoooodd  jjoobb!!",
  repeater2('') == ''
]

# using gsub with regexp
def repeater3(str)
  str.gsub(/(.)/, '\0\0')
end

p [
  repeater3('Hello') == "HHeelllloo",
  repeater3("Good job!") == "GGoooodd  jjoobb!!",
  repeater3('') == ''
]
