require 'test/unit'
require './lib/cal.rb'

class CalUnitTest < Test::Unit::TestCase

  def test_11_creates_a_new_instance_of_cal
    cal = Cal.new(8, 1999)
    assert(cal)
  end

  def test_12_get_month_header_returns_month_header
    cal = Cal.new(11, 2012)
    assert_equal("November", cal.get_month_header)
  end

  def test_13_get_days_of_week_returns_days_of_week
    cal = Cal.new(11, 2012)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.get_days_of_week)
  end

  def test_14_get_first_day_of_month_returns_first_day
    cal = Cal.new(4, 1877)
    assert_equal("Sunday", cal.get_first_day)
  end

  def test_15_get_first_day_of_month_returns_first_day
    cal = Cal.new(9, 1977)
    assert_equal("Thursday", cal.get_first_day)
  end

  def test_16_get_first_day_of_month_returns_first_day
    cal = Cal.new(1, 2077)
    assert_equal("Friday", cal.get_first_day)
  end

  def test_17_get_first_day_of_month_returns_first_day
    cal = Cal.new(2, 2577)
    assert_equal("Saturday", cal.get_first_day)
  end

  def test_18_get_dates_returns_dates
    cal = Cal.new(2, 2012)
    assert_equal("          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29", cal.get_dates)
  end

  def test_19_get_dates_returns_dates
    cal = Cal.new(2, 2222)
    assert_equal("                1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28", cal.get_dates)
  end

  def test_20_get_dates_returns_dates
    cal = Cal.new(1, 1847)
    assert_equal("                1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28 29 30\n31", cal.get_dates)
  end

  def test_21_get_dates_returns_dates
    cal = Cal.new(4, 1982)
    assert_equal("             1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29 30", cal.get_dates)
  end

  def test_22_get_dates_returns_dates
    cal = Cal.new(9, 2340)
    assert_equal(" 1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29 30", cal.get_dates)
  end

  def test_23_get_dates_returns_dates
    cal = Cal.new(8, 2611)
    assert_equal("             1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29 30 31", cal.get_dates)
  end

  def test_24_get_dates_returns_dates
    cal = Cal.new(9, 2012)
    assert_equal("                   1\n 2  3  4  5  6  7  8\n 9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30", cal.get_dates)
  end

  def test_25_get_dates_returns_dates
    cal = Cal.new(2, 1912)
    assert_equal("             1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29", cal.get_dates)
  end

  def test_26_format_month_formats_month
    cal = Cal.new(2, 1912)
    assert_equal("   February 1912\nSu Mo Tu We Th Fr Sa\n             1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29\n\n", cal.format_month)
  end

  def test_27_get_week_returns_specified_week
    cal = Cal.new(4, 1888)
    assert_equal("15 16 17 18 19 20 21", cal.get_week(2))
  end

  def test_28_get_week_returns_specified_week
    cal = Cal.new(3, 2131)
    assert_equal("             1  2  3", cal.get_week(0))
  end

  def test_29_get_week_returns_specified_week
    cal = Cal.new(5, 2980)
    assert_equal("28 29 30 31", cal.get_week(4))
  end

  def test_30_get_week_returns_specified_week
    cal = Cal.new(2, 1999)
    assert_equal(" 7  8  9 10 11 12 13", cal.get_week(1))
  end

  def test_31_get_week_returns_specified_week
    cal = Cal.new(6, 2066)
    assert_equal("20 21 22 23 24 25 26", cal.get_week(3))
  end

  def test_32_get_week_returns_specified_week
    cal = Cal.new(1, 2000)
    assert_equal("30 31", cal.get_week(5))
  end

end