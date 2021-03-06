class Cal

  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
    if @month > 0 and @year == 0
      @year = @month
      @month = 1
      puts format_year
    elsif @month == 0 and @year == 0
      time = Time.new
      @year = time.year
      @month = time.month
      puts format_month
    else
      puts format_month
    end
  end

  def get_month_header
    month_array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    chosen_month = month_array[@month-1]
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

  def line_breaker(storage)
    storage = storage.join.rstrip
    storage[20] = "\n"
    storage[41] = "\n"
    storage[62] = "\n"
    storage[83] = "\n"
    if storage[104] == nil
      return storage
    else
      storage[104] = "\n"
    end
    storage
  end

  def spacer(n)
    spaces = ""
    n.times do
      spaces << " "
    end
    spaces
  end

  def get_dates
    storage = []
    i = 1
    while i <= 28
      storage << i
      storage << " "
      if i <= 8
        storage << " "
      end
      i += 1
    end

    if @month == 4 or @month == 6 or @month == 9 or @month == 11
      storage = storage.push(29," ",30)  
    elsif @month == 2 and leap?
      storage = storage.push(29)
    elsif @month == 2
      storage
    else
      storage = storage.push(29," ",30," ",31)
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
    elsif get_first_day == "Friday" and @month == 2
      storage = storage.unshift(spacer(16))
      line_breaker(storage)
    elsif get_first_day == "Friday"
      storage = storage.unshift(spacer(16))
      line_breaker(storage)
    elsif get_first_day == "Saturday" and @month == 2
      storage = storage.unshift(spacer(19))
      line_breaker(storage)
    elsif get_first_day == "Saturday"
      storage = storage.unshift(spacer(19))
      line_breaker(storage)
    end

  line_breaker(storage)

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
        if @month == 3 or @month == 6 or @month == 9 or @month == 12
          ""
        else
          spacer(20)
        end
      else
        date_string.slice(105..124)
      end
    end
  end

  def format_month
    header = "#{get_month_header} #{@year}"
    header = header.center(20).rstrip
    return "#{header}\n#{get_days_of_week}\n#{get_dates}\n\n"
  end

  def format_year
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
          if @month == 3 or @month == 6 or @month == 9 or @month == 12
            week_lines.rstrip
          else
            buffer = 20 - get_week(week_index).size
            week_lines << spacer(buffer)
          end
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

    year_title = @year.to_s
    year_title = year_title.center(62).rstrip
    "#{year_title}\n\n#{compiled_year}"
  end

end

if __FILE__ == $0
  month = ARGV[0]
  year = ARGV[1]
  Cal.new(month, year)
end
  