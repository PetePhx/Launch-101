puts "Practice Problem 1"
puts
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# Answer:

# Using the #to_i method within the sort block with the <=> operator:

arr2 = arr.sort! { |x, y| y.to_i <=> x.to_i }

p arr2

<<-OUTPUT

["11", "10", "9", "8", "7"]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 2"
puts
# How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books_sorted = books.sort { |x, y| x[:published].to_i <=> y[:published].to_i }


p books_sorted

<<-OUTPUT

[{:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"},
 {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"},
 {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"},
 {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}]

OUTPUT

# we could also use the sort_by method with the same result:

puts
p books.sort_by { |book| book[:published].to_i }

# ============================================================================ #
puts
puts "Practice Problem 3"
puts

# For each of these collection objects demonstrate how you would reference the
# letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# Answer:

p [ arr1[2][1][3], arr2[1][:third][0], arr3[2][:third][0][0],
    hsh1['b'][1],  hsh2[:third].key(0) ]


<<-OUTPUT

["g", "g", "g", "g", "g"]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 4"
puts

# For each of these collection objects where the value 3 occurs, demonstrate
# how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# Answer:

arr1[1][1] = 4
p arr1

arr2[2] = 4
p arr2

hsh1[:first][2][0] = 4
p hsh1

hsh2[['a']][:a][2] = 4
p hsh2

<<-OUTPUT

[1, [2, 4], 4]
[{:a=>1}, {:b=>2, :c=>[7, 6, 5], :d=>4}, 4]
{:first=>[1, 2, [4]]}
{["a"]=>{:a=>["1", :two, 4], :b=>4}, "b"=>5}

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 5"
puts

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.


# Answer: first select male monsters using #select, then iterate using #each:

sum = 0
males = munsters.select { |k,v| v["gender"] == "male"}

males.each do |k, v|
  sum += v["age"]
end

p sum

<<-OUTPUT

444

OUTPUT
puts
# Annoying single line solution:
p munsters.select {|k,v| v["gender"] == "male"}.values.map { |h| h["age"] }.sum

# ============================================================================ #
puts
puts "Practice Problem 6"
puts

# One of the most frequently used real-world string properties is that of
# "string substitution", where we take a hard-coded string and modify it with
# various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender
# of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# ...like this:

# (Name) is a (age)-year-old (male or female).

# Answer:

munsters.each do |name, props|
  puts "#{name} is a #{props["age"]}-year-old #{props["gender"]}."
end


<<-OUTPUT

Herman is a 32-year-old male.
Lily is a 30-year-old female.
Grandpa is a 402-year-old male.
Eddie is a 10-year-old male.
Marilyn is a 23-year-old female.

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 7"
puts

# Given this code, what would be the final values of a and b? Try to work this
# out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# Answer

# arr[0] points to a. by running a =+ operation, the value of arr[0] is
# reassigned, but a in not changed. In the second operation, arr[1][0] points to
# the first element of b, 5, where after a -= operation, the value is
# substituted by 5 - 2, or 3.

# The final values of a and b are expected to be 2 and [3, 8], respectively.

p a
p b

<<-OUTPUT

2
[3, 8]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 8"
puts

# Using the each method, write some code to output all of the vowels from the
# strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']}

# Answer: Just use nested each loops and the #include? method for string

hsh.each do |_, val|
  val.each do |str|
    str.each_char { |ch| print(ch + ' ') if 'aeiou'.include? ch }
  end
end
puts
<<-OUTPUT

e u i o o u e o e e a o

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 9"
puts

# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# Answer: use #map, with #sort inside, with <=> inside to specify the reverse
# order of sorting.

arr2 = arr.map do |ary|
  ary.sort { |a, b| b <=> a}
end

p arr2

<<-OUTPUT

[["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 10"
puts

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the
# original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

 # Answer: #map'ing the array elements, with #each method updating the hash
 # values.

arr2 = arr.map do |hsh|
  hsh.each do |key, _|
    hsh[key] += 1
  end
end
p arr2

<<-OUTPUT

[{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 11"
puts

# Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in
# structure to the original but containing only the integers that are multiples
# of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = \
arr.map do |ary|
  ary.select {|num| num % 3 == 0}
end

p arr2

<<-OUTPUT

[[], [3], [9], [15]]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 12"
puts

# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# Answer: use #each to add elements to an originally empty hash pairwise.

hsh = {}

arr.each do |ary|
  hsh[ary[0]] = ary[1]
end

p hsh
<<-OUTPUT

{:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 13"
puts

# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically according to the numeric
# value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:

[[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# Answer:

# We will supply subarrays of odd elements to the #sort_by method for
# comparison purpose:

arr2 = \
arr.sort_by do |ary|
  ary.select { |num| num.odd?}
end

p arr2
<<-OUTPUT

[[1, 8, 3], [1, 6, 7], [1, 4, 9]]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 14"
puts

# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return value should look like this:

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Answer: Starting with an empty array, we loop over the hash values with #each,
# depending on the fuit/vegetable value, we choose to the color capitalized or
# size #upcase'd #push'ed to the array.

arr = []

hsh.each do |_, props|
  case props[:type]
  when 'fruit'
    arr << props[:colors].map {|col_str| col_str.capitalize}
  when 'vegetable'
    arr << props[:size].upcase
  end
end

p arr
<<-OUTPUT

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 15"
puts

# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# Answer: The hashes in the array all have the same depth, so we should be able
# to just use #select and #all? with #even?

arr2 = \
arr.select do |hsh|
  hsh.all? do |_, ary|
    ary.all? do |num|
      num.even?
    end
  end
end

p arr2
<<-OUTPUT

[{:e=>[8], :f=>[6, 10]}]

OUTPUT

# ============================================================================ #
puts
puts "Practice Problem 16"
puts

# Each UUID consists of 32 hexadecimal characters, and is typically broken into
# 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

# Answer:

# first we figure the dash/huphen indices"
# f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91
# 012345678901234567890123456789012345
#
# indices: 8, 13, 18, 23,
# using an each loop to create random numbers, then convert to hexadecimal:

INDICES = [8, 13, 18, 23]
def uuid_generate
  uuid = ''
  32.times do
    char = rand(16).to_s(16)
    uuid += char
  end
  INDICES.each do |idx|
    uuid.insert(idx, '-')
  end
  uuid
end

10.times { p uuid_generate }

<<-OUTPUT

"1551de7b-91d9-8de2-a389-61a1065912de"
"bdc4bba1-7806-2fe1-5b59-acbf4b6c01cf"
"ef6b6918-a343-4179-8ea1-0d74e480acbf"
"c2ac0b12-b2cb-72d2-29d5-932114fd6fd6"
"7f5f5f9b-776b-da06-09c7-dd9c1f72e4de"
"8af3cd1d-4e5d-6b98-407f-9aa8980cd13a"
"b58fb228-2c01-522a-36f1-0b859af7a32b"
"38de6ae8-9285-61ad-b329-e8e8871ec8e0"
"dcd600d0-1d00-6c59-0cc8-2541f8e1e62b"
"c7ef7ff7-3f72-8ffa-3881-d0b0410d917a"

OUTPUT

# ============================================================================ #
