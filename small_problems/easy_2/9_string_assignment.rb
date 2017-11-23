name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?

# Answer: Both name and save_name variables point to the same block in the
# memory. since #upcase! mutates the caller, both variables point to the memory
# space with updated string after the operation. We expect 'BOB' printed twice.

# Output:
'''
BOB
BOB
'''

# checks out!
