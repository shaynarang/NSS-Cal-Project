require 'test/unit'

class CalIntegrationTest < Test::Unit::TestCase

  # A leap year is a year containing one additional day in order to keep the calendar year synchronized with the astronomical or seasonal year.

  # A year that is not a leap year is called a common year.
  
  # According to the Gregorian Calendar, every year that is exactly divisible by four is a leap year, except for years that are exactly divisible by 100; the centurial years that are exactly divisible by 400 are still leap years. For example, the year 1900 is not a leap year; the year 2000 is a leap year.

  def test_01_complete_output
    assert_equal(`cal 2 2012`, `ruby lib/cal.rb 2 2012`)
    #leap year
  end

  def test_02_common_year
    assert_equal(`cal 2 1800`, `ruby lib/cal.rb 2 1800`)
    #common year
  end

  def test_03_common_year
    assert_equal(`cal 2 1900`, `ruby lib/cal.rb 2 1900`)
    #common year
  end

  def test_04_leap_year
    assert_equal(`cal 2 2000`, `ruby lib/cal.rb 2 2000`)
    #leap year
  end

  def test_05_common_year
    assert_equal(`cal 2 2100`, `ruby lib/cal.rb 2 2100`)
    #common year
  end

  def test_06_leap_year
    assert_equal(`cal 2 1804`, `ruby lib/cal.rb 2 1804`)
    #leap year
  end

  def test_07_leap_year
    assert_equal(`cal 2 1852`, `ruby lib/cal.rb 2 1852`)
    #leap year
  end

  def test_08_leap_year
    assert_equal(`cal 2 1904`, `ruby lib/cal.rb 2 1904`)
    #leap year
  end

  def test_09_leap_year
    assert_equal(`cal 2 1952`, `ruby lib/cal.rb 2 1952`)
    #leap year
  end

  def test_10_common_year
    assert_equal(`cal 2 2013`, `ruby lib/cal.rb 2 2013`)
    #common year
  end

end