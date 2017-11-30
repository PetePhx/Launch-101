# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes and seconds.

# symbols:
DEG_SYM = "\xC2\xB0"
MIN_SYM = "\'"
SEC_SYM = "\""
# conversion constants
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = 60 * 60
SECONDS_PER_CIRCLE = 360 * SECONDS_PER_DEGREE

def dms(num)
  num_in_sec = (num * SECONDS_PER_DEGREE).round % SECONDS_PER_CIRCLE
  degrees, rem = num_in_sec.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = rem.divmod(SECONDS_PER_MINUTE)

  format("%d#{DEG_SYM}%02d#{MIN_SYM}%02d#{SEC_SYM}",\
         degrees, minutes, seconds)
end

p [
  dms(30) == %(30°00'00"),
  dms(76.73) == %(76°43'48"),
  dms(254.6) == %(254°36'00"),
  dms(93.034773) == %(93°02'05"),
  dms(0) == %(0°00'00"),
  dms(360) == %(0°00'00"),
  dms(-181) == %(179°00'00")
]
