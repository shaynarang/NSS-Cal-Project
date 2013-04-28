require 'test/unit'
require './lib/cal.rb'

class CalUnitTest < Test::Unit::TestCase

  def test_11_creates_a_new_instance_of_cal
    cal = Cal.new(8, 1999)
    assert (cal)
  end

  def test_12_get_month_header_returns_month_header
    cal = Cal.new(11, 2012)
    assert_equal("   November 2012", cal.get_month_header)
  end

  def test_13_get_days_of_week_returns_days_of_week
    cal = Cal.new(11, 2012)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.get_days_of_week)
  end

  # def test_14_get_first_day_of_month_returns_first_day
  #   cal = Cal.new(4, 1877)
  #   assert_equal("Sunday", cal.get_first_day)
  # end

  # def test_15_get_dates_returns_dates
  #   cal = Cal.new(2, 2012)
  #   assert_equal("          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29\n\n", cal.get_dates)
  # end

end