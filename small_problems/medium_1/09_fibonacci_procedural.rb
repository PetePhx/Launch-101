# Fibonacci Numbers (Procedural)

# Rewrite your recursive fibonacci method so that it computes its results
# without recursion.

def fibonacci(nth)
  acc1 = 1
  acc2 = 1
  return acc2 if nth <= 2
  (nth - 2).times do
    acc1, acc2 = acc2, acc1 + acc2
  end
  acc2
end

p [
  fibonacci(20) == 6765,
  fibonacci(100) == 354224848179261915075,
  fibonacci(100_001).to_s.length == 20899
]

# Note: instead of (nth - 2).times we could go with 3.upto(nth)
# for a more expressive code.

# using reduce:
def fibonacci2(nth)
  3.upto(nth).reduce([1, 1]) { |(acc1, acc2), _| [acc2, acc1 + acc2] }[1]
end

p [
  fibonacci2(20) == 6765,
  fibonacci2(100) == 354224848179261915075,
  fibonacci2(100_001).to_s[0, 20] == '42026927029951543863'
]

# Note: use parentheses for arrays inside block variable definition  |...|.
