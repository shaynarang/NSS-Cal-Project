class Cal

  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
    if @month > 0 and @year == 0
      @year = @month
      @month = 1
      print_year
    elsif @month == 0 and @year == 0
      time = Time.new
      @year = time.year
      @month = time.month
      print_month
    else
      print_month
    end
  end

  def get_month_header
    month_array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    chosen_month = month_array[@month-1]
    "#{chosen_month}"
  end

  def get_days_of_week
    "Su Mo Tu We Th Fr Sa"
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
    twenty_eight_day_array = []
    i = 1
    while i <= 28
      twenty_eight_day_array << i
      twenty_eight_day_array << " "
      if i <= 8
        twenty_eight_day_array << " "
      end
      i += 1
    end

    twenty_nine_day_array = []
    j = 1
    while j <= 29
      twenty_nine_day_array << j
      twenty_nine_day_array << " "
      if j <= 8
        twenty_nine_day_array << " "
      end
      j += 1
    end

    thirty_day_array = []
    k = 1
    while k <= 30
      thirty_day_array << k
      thirty_day_array << " "
      if k <= 8
        thirty_day_array << " "
      end
      k += 1
    end

    thirty_one_day_array = []
    l = 1
    while l <= 31
      thirty_one_day_array << l
      thirty_one_day_array << " "
      if l <= 8
        thirty_one_day_array << " "
      end
      l += 1
    end

    if @month == 1 or @month == 3 or @month == 5 or @month == 7 or @month == 8 or @month == 10 or @month == 12
      storage = thirty_one_day_array
    elsif @month == 4 or @month == 6 or @month == 9 or @month == 11
      storage = thirty_day_array    
    elsif @month == 2 and leap?
      storage = twenty_nine_day_array
    else
      storage = twenty_eight_day_array
    end

    if get_first_day == "Sunday"
      storage = storage.unshift(spacer(1))    
    elsif get_first_day == "Monday"
      storage = storage.unshift(spacer(4))
    elsif get_first_day == "Tuesday"
      storage = storage.unshift(spacer(7))
    elsif get_first_day == "Wednesday"
      storage = storage.unshift(spacer(10))
    elsif get_first_day == "Thursday"
      storage = storage.unshift(spacer(13))
    elsif get_first_day == "Friday" and (@month == 2)
      storage = storage.unshift(spacer(16))
      storage = storage.join.rstrip
      storage[20] = "\n"
      storage[41] = "\n"
      storage[62] = "\n"
      storage[83] = "\n"
      return storage
    elsif get_first_day == "Friday"
      storage = storage.unshift(spacer(16))
      storage = storage.join.rstrip
      storage[20] = "\n"
      storage[41] = "\n"
      storage[62] = "\n"
      storage[83] = "\n"
      storage[104] = "\n"
      return storage
    elsif get_first_day == ("Saturday") and (@month == 2)
      storage = storage.unshift(spacer(19))
      storage = storage.join.rstrip
      storage[20] = "\n"
      storage[41] = "\n"
      storage[62] = "\n"
      storage[83] = "\n"
      return storage
    elsif get_first_day == "Saturday"
      storage = storage.unshift(spacer(19))
      storage = storage.join.rstrip
      storage[20] = "\n"
      storage[41] = "\n"
      storage[62] = "\n"
      storage[83] = "\n"
      storage[104] = "\n"
      return storage
    end

  storage = storage.join.rstrip
  storage[20] = "\n"
  storage[41] = "\n"
  storage[62] = "\n"
  storage[83] = "\n"
  storage

  end

  def get_week(week)
    date_string = get_dates
    if week == 0
      date_string.slice(0..19)
    elsif week == 1
      date_string.slice(21..40)
    elsif week == 2
      date_string.slice(42..61)
    elsif week == 3
      date_string.slice(63..82)
    elsif week == 4
      date_string.slice(84..103) 
    elsif week == 5
      if date_string.slice(105..124) == nil
        return "                    "
      else
        date_string.slice(105..124)
      end
    end
  end

  def spacer(n)
    spaces = ""
    n.times do
      spaces << " "
    end
    spaces
  end

  def print_month
    header = "#{get_month_header} #{@year}"
    header = header.center(20).rstrip
    puts "#{header}\n#{get_days_of_week}\n#{get_dates}\n\n"
    return "#{get_month_header} #{@year}\n#{get_days_of_week}\n#{get_dates}\n\n"
  end

  def print_year

    compiled_year = ""

    starting_index = 1
    while starting_index < 13
    ending_index = starting_index + 2
    month_line = ""
    (starting_index..ending_index).each do |month|
      @month = month
      if @month == ending_index
        month_line << get_month_header.center(20).rstrip
        month_line << "\n"
      else
        month_line << get_month_header.center(20)
        month_line << "  "
      end
    end

    day_line = ""
    3.times do |month_index|
      day_line << get_days_of_week
      if month_index == 2
        day_line << "\n"
      else
        day_line << "  "
      end
    end

    week_lines = ""
    6.times do |week_index|
      (starting_index..ending_index).each do |month|
        @month = month
        week_lines << get_week(week_index)
        if get_week(week_index).size < 20
          buffer = 20 - get_week(week_index).size
          week_lines << spacer(buffer)
        end
        if @month == ending_index
          week_lines << "\n"
        else
          week_lines << "  "
        end
      end
    end

    starting_index += 3
    ending_index += 3

    compiled_year << "#{month_line}#{day_line}#{week_lines}"

    end
    year_title = @year
    year_title = year_title.to_s
    year_title = year_title.center(65).rstrip
    puts "#{year_title}\n\n#{compiled_year}"

  end

end

if __FILE__ == $0
  month = ARGV[0]
  year = ARGV[1]
  output = Cal.new(month, year)
  # output.print_month
end
  