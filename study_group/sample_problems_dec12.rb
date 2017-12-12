def permutations(str)
  out_arr = []
  arr = str.chars
  (0...arr.length).to_a.permutation do |perm|
    perm_arr = (0...arr.length).map { |idx| arr[perm[idx]] }
    out_arr << perm_arr.join("")
  end
  out_arr.uniq
end
puts
p permutations("aab")

=begin
-input: string of parentheses
-output: boolean: valid order of prentheses
-algorithm:
  - initialize a balace variable
  - iterate over characters of the input string
    - increase or decrease balance var, depending on character ( or ), resp.
    - if balance less than 0, return false
  - return balance == 0,
=end

def valid_parentheses(str)
  balance = 0
  str.each_char do |chr|
    case chr
    when "(" then balance += 1
    when ")" then balance -= 1
    end
    return false if balance < 0
  end
  balance == 0
end

valid_parentheses("hi(hi)()")


=begin
-input: string, containing parentheses, brackets, etc.
-output: boolean: are the parenth/brackets/curlies balanced?
-algorithm
  - start by removing non interestig characters from the string
  - iterate:
    - in each round, remove pairs of (), {}, []
    - break if the string length doesn't change
  - is the string empty?
=end

def validBraces(str_input)
  str = str_input.dup
  str.delete!("^(){}[]")
  loop do
    old_length = str.length
    str.gsub!(/\(\)|\[\]|\{\}/, "")
    new_length = str.length
    break if old_length == new_length
  end
  str == ''
end
puts
p validBraces("(hi){}[])(][}{")
