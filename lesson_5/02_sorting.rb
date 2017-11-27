# Without running the code, try to figure out what would be returned here:

['arc', 'bat', 'cape', 'ants', 'cap'].sort

# Answer: Based on the documentation for <=> operator, the comparison for
# strings is done based the the first letters, and if the first letters are the
# same, based on the second letters and so on. if the longer string has the
# shorter string in its beginning, the longer one is considered "higher"
# ordinally.

# we expect the following order from smallest to greatest string ordinals:

# ['ants', 'arc', 'bat', 'cap', 'cape']

p ['arc', 'bat', 'cape', 'ants', 'cap'].sort


<<-OUTPUT

["ants", "arc", "bat", "cap", "cape"]

OUTPUT

# ============================================================================ #
puts
# Have a read of the Ruby Docs and see if you can work out what would be
# returned when sort is called on this array of arrays:

[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort


# Answer
# The array <=> operator works somewhat similar to string <=> operator,
# following an elementwise comparison to determine the ordinal position of two
# arrays. Based on this, we expect the following sorted array of arrays:

[ ['a', 'car', 'd'],
  ['a', 'car', 'd', 3],
  ['a', 'cat', 'b', 'c'],
  ['b', 2] ]

p [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

<<-OUTPUT

[["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]

OUTPUT
