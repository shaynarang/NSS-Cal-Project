
# integration testing
# month = ARGV[0]
# year = ARGV[1]

# puts `cal #{month} #{year}`
    
   #  January 2012
   # February 2012
   #   March 2012
   #   April 2013
   #    May 2012
   #   June 2012
   #   July 2012
   #  August 2012
   # September 2012
   #  October 2012
   # November 2012
   # December 2012

class Cal

  def initialize(month, year)
    month_array = ["    January", "   February", "     March", "     April", "May", "     June", "     July", "    August", "   September", "    October", "   November", "   December"]
    chosen_month = month_array[month - 1]
    @month = chosen_month
    @year = year
  end

  def get_month_header
    "#{@month} #{@year}"
  end

  def get_days_of_week
    "Su Mo Tu We Th Fr Sa"
  end

  def get_first_day
    #Zeller's Congruence
    #h is the day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ...)
    # day_array = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    # chosen_day = day_array[h]
  end

  def get_dates
  # A week that starts on Monday is preceded by 1 space
  # A week that starts on Tuesday is preceded by 4 space
  # A week that starts on Wednesday is preceded by 7 space
  # A week that starts on Thursday is preceded by 10 space
  # A week that starts on Friday is preceded by 13 space
  # A week that starts on Saturday is preceded by 16 space
  # A week that starts on Sunday is preceded by 19 space
  end

end

# cal = Cal.new(month, year)
# cal.print_cal
