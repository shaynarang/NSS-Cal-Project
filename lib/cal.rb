class Cal

  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
  end

  def get_month_header
    month_array = ["    January", "   February", "     March", "     April", "May", "     June", "     July", "    August", "   September", "    October", "   November", "   December"]
    chosen_month = month_array[@month-1]
    "#{chosen_month} #{@year}\n"
  end

  def get_days_of_week
    "Su Mo Tu We Th Fr Sa\n"
  end

  def get_first_day

    m = @month
    if m == 1
      m = 13
      y = @year-1
    elsif m == 2
      m = 14
      y = @year-1
    else
      y = @year
    end

    h = ((1+((m+1)*26/10)) + y + (y/4) + 6 * (y/100) + (y/400))%7
    day_array = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    chosen_day = day_array[h]
  end

  def leap?
    if ((@year % 100 == 0) and (@year % 400 != 0)) or (@year % 4 != 0)
      false
    else
      true
    end
  end

  def get_dates

    twenty_eight_day_array = ["1", "  2", "  3", "  4", "  5", "  6", "  7", "  8", "  9", " 10", " 11", " 12", " 13", " 14", " 15", " 16", " 17", " 18", " 19", " 20", " 21", " 22", " 23", " 24", " 25", " 26", " 27", " 28", "\n\n"]
    twenty_nine_day_array = ["1", "  2", "  3", "  4", "  5", "  6", "  7", "  8", "  9", " 10", " 11", " 12", " 13", " 14", " 15", " 16", " 17", " 18", " 19", " 20", " 21", " 22", " 23", " 24", " 25", " 26", " 27", " 28", " 29", "\n\n"]
    thirty_day_array = ["1", "  2", "  3", "  4", "  5", "  6", "  7", "  8", "  9", " 10", " 11", " 12", " 13", " 14", " 15", " 16", " 17", " 18", " 19", " 20", " 21", " 22", " 23", " 24", " 25", " 26", " 27", " 28", " 29", " 30", "\n\n"]
    thirty_one_day_array = ["1", "  2", "  3", "  4", "  5", "  6", "  7", "  8", "  9", " 10", " 11", " 12", " 13", " 14", " 15", " 16", " 17", " 18", " 19", " 20", " 21", " 22", " 23", " 24", " 25", " 26", " 27", " 28", " 29", " 30", " 31", "\n\n"]

    if @month == 1
      storage = thirty_one_day_array
    elsif @month == 3
      storage = thirty_one_day_array
    elsif @month == 4
      storage = thirty_day_array
    elsif @month == 5
      storage = thirty_one_day_array
    elsif @month == 6
      storage = thirty_day_array
    elsif @month == 7
      storage = thirty_one_day_array
    elsif @month == 8
      storage = thirty_one_day_array
    elsif @month == 9
      storage = thirty_day_array
    elsif @month == 10
      storage = thirty_one_day_array
    elsif @month == 11
      storage = thirty_day_array
    elsif @month == 12
      storage = thirty_one_day_array
    elsif @month == (2) and (leap?)
      storage = twenty_nine_day_array
    else
      storage = twenty_eight_day_array
    end

    if get_first_day == "Sunday"
      storage = storage.unshift(" ")    
    elsif get_first_day == "Monday"
      storage = storage.unshift("    ")
    elsif get_first_day == "Tuesday"
      storage = storage.unshift("       ")
    elsif get_first_day == "Wednesday"
      storage = storage.unshift("          ")
    elsif get_first_day == "Thursday"
      storage = storage.unshift("             ")
    elsif get_first_day == ("Friday") and (@month == 2)
      storage = storage.unshift("                ")
      storage = storage.join
      storage[20] = "\n"
      storage[41] = "\n"
      storage[62] = "\n"
      storage[83] = "\n"
      return storage
    elsif get_first_day == "Friday"
      storage = storage.unshift("                ")
      storage = storage.join
      storage[20] = "\n"
      storage[41] = "\n"
      storage[62] = "\n"
      storage[83] = "\n"
      storage[104] = "\n"
      return storage
    elsif get_first_day == ("Saturday") and (@month == 2)
      storage = storage.unshift("                   ")
      storage = storage.join
      storage[20] = "\n"
      storage[41] = "\n"
      storage[62] = "\n"
      storage[83] = "\n"
      return storage
    elsif get_first_day == "Saturday"
      storage = storage.unshift("                   ")
      storage = storage.join
      storage[20] = "\n"
      storage[41] = "\n"
      storage[62] = "\n"
      storage[83] = "\n"
      storage[104] = "\n"
      return storage
    end

  storage = storage.join
  storage[20] = "\n"
  storage[41] = "\n"
  storage[62] = "\n"
  storage[83] = "\n"
  storage

  end

  def print_cal
    puts "#{get_month_header}#{get_days_of_week}#{get_dates}"
    return "#{get_month_header}#{get_days_of_week}#{get_dates}"
  end

end

if __FILE__ == $0
  month = ARGV[0]
  year = ARGV[1]
  output = Cal.new(month, year)
  output.print_cal
end


    #February
    # if @month == 2 and cal.get_first_day == "Sunday"
    #   " " + "1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29\n\n"

    # elsif @month == 2 and cal.get_first_day == "Monday"
    #   "    " + "1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29\n\n"

    # elsif @month == 2 and cal.get_first_day == "Tuesday"
    #   "       " + "1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28 29\n\n"

    # elsif @month == 2 and cal.get_first_day == "Wednesday"
    #   "          " + "1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29\n\n"

    # elsif @month == 2 and cal.get_first_day == "Thursday"
    #   "             " + "1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29\n\n"

    # elsif @month == 2 and cal.get_first_day == "Friday"
    #   "                " + "1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28 29\n\n"

    # elsif @month == 2 and cal.get_first_day == "Saturday"
    #   "                   " + "1\n 2  3  4  5  6  7  8\n 9 10 11\n12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n\n"

    # #Thirty-one Day Months
    # elsif (@month == (1 or 3 or 5 or 7 or 8 or 10 or 12)) and cal.get_first_day == "Sunday"
    #   " " + "1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29 30 31\n\n"
    
    # elsif (@month == (1 or 3 or 5 or 7 or 8 or 10 or 12)) and cal.get_first_day == "Monday"
    #   "    " + "1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31\n\n"
    
    # elsif (@month == (1 or 3 or 5 or 7 or 8 or 10 or 12)) and cal.get_first_day == "Tuesday"
    #   "       " + "1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28 29 30 31\n\n"
    
    # elsif (@month == (1 or 3 or 5 or 7 or 8 or 10 or 12)) and cal.get_first_day == "Wednesday"
    #   "          " + "1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n"

    # elsif (@month == (1 or 3 or 5 or 7 or 8 or 10 or 12)) and cal.get_first_day == "Thursday"
    #   "             " + "1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29 30 31\n\n"

    # elsif (@month == (1 or 3 or 5 or 7 or 8 or 10 or 12)) and cal.get_first_day == "Friday"
    #   "                " + "1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28 29 30\n31\n\n"

    # elsif (@month == (1 or 3 or 5 or 7 or 8 or 10 or 12)) and cal.get_first_day == "Saturday"
    #   "                   " + "1\n 2  3  4  5  6  7  8\n 9 10 11\n12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30 31\n\n"

    # #Thirty Day Months
    # elsif (@month == (4 or 6 or 9 or 11)) and cal.get_first_day == "Sunday"
    #   " " + "1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29 30\n\n"
    
    # elsif (@month == (4 or 6 or 9 or 11)) and cal.get_first_day == "Monday"
    #   "    " + "1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30\n\n"
    
    # elsif (@month == (4 or 6 or 9 or 11)) and cal.get_first_day == "Tuesday"
    #   "       " + "1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28 29 30\n\n"
    
    # elsif (@month == (4 or 6 or 9 or 11)) and cal.get_first_day == "Wednesday"
    #   "          " + "1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30\n\n"

    # elsif (@month == (4 or 6 or 9 or 11)) and cal.get_first_day == "Thursday"
    #   "             " + "1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29 30\n\n"

    # elsif (@month == (4 or 6 or 9 or 11)) and cal.get_first_day == "Friday"
    #   "                " + "1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28 29 30\n\n"

    # elsif (@month == (4 or 6 or 9 or 11)) and cal.get_first_day == "Saturday"
    #   "                   " + "1\n 2  3  4  5  6  7  8\n 9 10 11\n12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30\n\n"
    # end
