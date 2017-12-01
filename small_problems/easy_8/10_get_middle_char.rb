# Get The Middle Character

# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument. If the argument has an odd length,
# you should return exactly one character. If the argument has an even length,
# you should return exactly two characters.

def center_of(str)
  sz = str.size
  sz.even? ? str[sz / 2 - 1, 2] : str[sz / 2]
end

p [
  center_of('I love ruby') == 'e',
  center_of('Launch School') == ' ',
  center_of('Launch') == 'un',
  center_of('Launchschool') == 'hs',
  center_of('x') == 'x'
]

# even more concise solution:

def center_of2(str)
  sz = str.size
  str[(sz - 1) / 2..sz / 2]
end

p [
  center_of2('I love ruby') == 'e',
  center_of2('Launch School') == ' ',
  center_of2('Launch') == 'un',
  center_of2('Launchschool') == 'hs',
  center_of2('x') == 'x'
]
