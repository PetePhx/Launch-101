# Unlucky Days

# Write a method that returns the number of Friday the 13ths in the year given
# by an argument. You may assume that the year is greater than 1752 (when the
# United Kingdom adopted the modern Gregorian Calendar) and that it will remain
# in use for the foreseeable future.

def friday_13th(yr)
  total = 0
  1.upto(12) { |mon| total += 1 if Time.new(yr, mon, 13).friday? }
  total
end

p [
  friday_13th(2015) == 3,
  friday_13th(1986) == 1,
  friday_13th(2019) == 2
]

# A more compact syntax using count:

def friday_13th_2(yr)
  1.upto(12).count { |mon| Time.new(yr, mon, 13).friday? }
end

p [
  friday_13th_2(2015) == 3,
  friday_13th_2(1986) == 1,
  friday_13th_2(2019) == 2
]

# Further Exploration

# An interesting variation on this problem is to count the number months that
# have five Fridays. This one is harder than it sounds since you must account
# for leap years.

def five_friday_months(year)
  fridays_in_month = [0] * 12
  1.upto(12) do |month|
    1.upto(31) do |day|
      t = Time.new(year, month, day)
      fridays_in_month[month - 1] += 1 if t.month == month && t.friday?
    end
  end
  1.upto(12).select { |idx| fridays_in_month[idx - 1] == 5 }
end

p five_friday_months(2017)
p five_friday_months(2018)
p five_friday_months(2016)
p five_friday_months(2015)
p five_friday_months(2014)
p five_friday_months(1982)
