require './Constant/Constant_class.rb'
require 'time'
class Validation

attr_accessor :message
@constant_class = Constant_class.new

	#######################################**Valid_enrollment**##########################################################
	def valid_enrollment(enrollment)
		v_letters = enrollment[1,3].to_s
		v_number = enrollment[4,7].to_s
		
			if (enrollment.length  < 7 || enrollment.length > 8)
				@message= "enrollment incorrect: Must be 8 characters"			
				return false
			end
			
			if (enrollment[3].to_s) != '-'
				@message= "enrollment incorrect: 'AAA-1234'"
				return false
			end
			
			if (v_number.to_i < 1)
				@message= "enrollment incorrecta: The last digits must be number '-4444'"
				return false
			end
		return true
	end
	#######################################**Valid_enrollment**##########################################################
	
	

#########################################**valid_date**#########################################################
	def valid_date(in_Date)
	
		if (in_Date[2,1].to_s != "/" || in_Date[5,1].to_s != "/")
			@message= "Format Date incorrect DD/MM/AAAA"
			return false
		end 
		begin
			Date.parse(in_Date)
		rescue ArgumentError
			@message= "Format Date incorrect DD/MM/AAAA"
			return false
		end
		
		return true
	end
	#########################################**valid_date**#########################################################
	
	
	#########################################**valid_Hour**#########################################################
	def valid_Hour(in_Hour)
		hour = in_Hour[0,2].to_s
		minutes = in_Hour[3,2].to_s
		sign = in_Hour[2,1].to_s
		
		if ((hour.to_i < 0 )|| (hour.to_i > 24) )
			@message= "Hour incorrect: Example 00:23"
			return false
		end
		if ((minutes.to_i < 0) || (minutes.to_i > 59))
			@message= "Minutes incorrect: Example 00:59"
			return false
		end
		if (sign!=":")
			@message= "Sign incorrect: Example 22:59"
			return false
		end
		return true
	end
	#########################################**valid_Hour**#########################################################
	
	
	
end