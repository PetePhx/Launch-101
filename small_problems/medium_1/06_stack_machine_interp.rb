# Stack Machine Interpretation

# Write a method that implements a miniature stack-and-register-based
# programming language that has the following commands:

# * n Place a value n in the "register". Do not modify the stack.
# * PUSH Push the register value on to the stack. Leave the value in the
#   register.
# * ADD Pops a value from the stack and adds it to the register value, storing
#   the result in the register.
# * SUB Pops a value from the stack and subtracts it from the register value,
#   storing the result in the register.
# * MULT Pops a value from the stack and multiplies it by the register value,
#   storing the result in the register.
# * DIV Pops a value from the stack and divides it into the register value,
#   storing the integer result in the register.
# * MOD Pops a value from the stack and divides it into the register value,
#   storing the integer remainder of the division in the register.
# * POP Remove the topmost item from the stack and place in register
# * PRINT Print the register value

# All operations are integer operations (which is only important with DIV and
# MOD).

def minilang(str)
  operations = str.split(' ')
  stack = []
  register = [0]
  operations.each do |op|
    perform_op(op, stack, register)
  end
end

def perform_op(op, stack, register)
  if op.to_i.to_s == op
    register[0] = op.to_i
  else
    case op.upcase
    when 'PUSH' then stack << register[0]
    when 'ADD', 'SUB', 'MULT', 'DIV', 'MOD' then arithm(op, stack, register)
    when 'POP' then register[0] = stack.pop
    when 'PRINT' then puts register[0]
    end
  end
end

def arithm(op, stack, register)
  val = stack.pop
  case op
  when 'ADD' then register[0] += val
  when 'SUB' then register[0] -= val
  when 'MULT' then register[0] *= val
  when 'DIV' then register[0] /= val
  when 'MOD' then register[0] %= val
  end
end

# Examples:
minilang('PRINT')
# 0
puts
minilang('5 PUSH 3 MULT PRINT')
# 15
puts
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts
minilang('5 PUSH POP PRINT')
# 5
puts
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts
minilang('-3 PUSH 5 SUB PRINT')
# 8
puts
minilang('6 PUSH')
# (nothing printed; no PRINT commands)


# Further Exploration

#Try writing a minilang program to evaluate and print the result of this expression:

(3 + (4 * 5) - 7) / (5 % 3)
