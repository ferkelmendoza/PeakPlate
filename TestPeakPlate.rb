require_relative "./Logic/ValidaTion"
require_relative './Logic/Circulation'
require "test/unit"

class TestPeakPlate < Test::Unit::TestCase
	
	def test_simple
		valid_data = Validation.new
		circulation = Circulation.new
		circulation.enrollment="PQR-1392"
		circulation.date_circulation="20/02/2017"
		circulation.hour_circulation="20:17"
		
		assert_equal(true, valid_data.valid_enrollment(circulation.enrollment) )
		assert_equal(true, valid_data.valid_date(circulation.date_circulation) )
		assert_equal(true, valid_data.valid_Hour(circulation.hour_circulation) )
		assert_equal(true, circulation.valid_Circulation(circulation) )
  end
end
 

