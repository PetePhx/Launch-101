# Bannerizer

# Write a method that will take a short line of text, and print it within a box.

def print_in_box str
  sz = str.size
  puts '+' + '-' * (sz + 2) + '+'
  puts '|' + ' ' * (sz + 2) + '|'
  puts "| #{str} |"
  puts '|' + ' ' * (sz + 2) + '|'
  puts '+' + '-' * (sz + 2) + '+'
end

print_in_box('')


# Further Exploration

#  For a real challenge, try word wrapping very long messages so they appear
# on multiple lines, but still within a box.

SCREEN_WIDTH = 80

def string_blocks0 str
  str_arr = []
  block_num = ( str.size.to_f / (SCREEN_WIDTH - 4) ).ceil
  (0...block_num).each do |block_idx|
    str_arr << str[block_idx * (SCREEN_WIDTH - 4), (SCREEN_WIDTH - 4) ]
  end
  str_arr
end

def string_blocks str
  block_arr = []
  block_idx = 0
  str.each_line do |line|
    block_arr[block_idx] = ''
    line.split(' ').each do |word|
      if block_arr[block_idx].length + word.length + 1 <= SCREEN_WIDTH - 4
        block_arr[block_idx] << word + ' '  # add word with sapce to block
      elsif block_arr[block_idx].length + word.length == SCREEN_WIDTH - 4
        block_arr[block_idx] << word        # add word to block
        block_idx += 1                      # new block
        block_arr[block_idx] = ''
      else
        block_idx += 1                      # new block
        block_arr[block_idx] = word + ' '
      end
    end
    block_idx += 1
  end
  block_arr
end

# puts string_blocks2("hello " * 15 + "\n" + "hi " * 40)


def print_in_box_lines str
  puts '+-' + '-' * (SCREEN_WIDTH - 4) + '-+'
  puts '| ' + ' '* (SCREEN_WIDTH - 4) + ' |'
  string_blocks(str).each do |line|
    puts "| #{line.ljust(SCREEN_WIDTH - 4,' ')} |"
  end
  puts '| ' + ' '* (SCREEN_WIDTH - 4) + ' |'
  puts '+-' + '-' * (SCREEN_WIDTH - 4) + '-+'
end

print_in_box_lines( "On the plains of hesitation lie the blackened bones \
of countless millions who at the dawn of victory lay down to rest, \
and in resting died.\n\n --Adlai Stevenson" )

# +------------------------------------------------------------------------------+
# |                                                                              |
# | On the plains of hesitation lie the blackened bones of countless millions    |
# | who at the dawn of victory lay down to rest, and in resting died.            |
# |                                                                              |
# | --Adlai Stevenson                                                            |
# |                                                                              |
# +------------------------------------------------------------------------------+
