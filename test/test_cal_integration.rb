require 'test/unit'
# require 'cal'

class CalIntegrationTest < Test::Unit::TestCase

	def test_01_print_month_and_year
		assert_equal(`cal 2 2012`, `ruby lib/cal.rb 2 2012`)
	end

end