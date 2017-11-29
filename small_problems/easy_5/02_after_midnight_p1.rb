# After Midnight (Part 1)

# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any
# integer input.

# You may not use ruby's Date and Time classes.

MINUTES_In_HOUR = 60
MINUTES_IN_DAY = 24 * 60

def time_of_day num
  num %= MINUTES_IN_DAY
  hour, minute = num.divmod MINUTES_In_HOUR
  "#{format('%02d',hour)}:#{format('%02d',minute)}"
end

p [time_of_day(0) == "00:00",
  time_of_day(-3) == "23:57",
  time_of_day(35) == "00:35",
  time_of_day(-1437) == "00:03",
  time_of_day(3000) == "02:00",
  time_of_day(800) == "13:20",
  time_of_day(-4231) == "01:29"]

# Further Exploration

# How would you approach this problem if you were allowed to use ruby's Date
# and Time classes? Suppose you also needed to consider the day of week?
# (Assume that delta_minutes is the number of minutes before or after midnight
# between Saturday and Sunday; in such a method, a delta_minutes value of
# -4231 would need to produce a return value of Thursday 01:29.)

SECONDS_IN_MINUTE = 60
TIME_REF = Time.new(2017,1,1,0,0) # January 1st, year 2017. Sunday 00:00
WEEKDAYS = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

def time_of_day_2 minutes
  t = TIME_REF + ( minutes * SECONDS_IN_MINUTE )

  "#{WEEKDAYS[t.wday]} #{format('%02d:%02d', t.hour, t.min)}"
end

puts time_of_day_2(0)

puts time_of_day_2(60)

puts time_of_day_2(1440)

puts time_of_day_2(-1440)

puts time_of_day_2(-4231)
