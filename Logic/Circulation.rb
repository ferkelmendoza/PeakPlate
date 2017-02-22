require './Constant/Constant_class.rb'
require 'time'
class Circulation

	attr_accessor :enrollment, :date_circulation, :hour_circulation
	
	def valid_Circulation(circulation)
		day= Time.strptime(circulation.date_circulation, '%d/%m/%Y')  
		circulation.date_circulation = day.strftime("%A")
		lastDigit=circulation.enrollment.reverse[0,1].to_i		
		Constant_class::DAYS.each {|day|			
			if circulation.date_circulation.upcase == day[0]
				if (lastDigit==day[1] || lastDigit==day[2])					
					if ((Time.parse(circulation.hour_circulation)) >= (Time.parse(Constant_class::TIME_HOME_DAY)) && (Time.parse(circulation.hour_circulation)) <= (Time.parse(Constant_class::TIME_END_DAY)))||
						((Time.parse(circulation.hour_circulation)) >= (Time.parse(Constant_class::TIME_HOME_NIGHT)) && (Time.parse(circulation.hour_circulation)) <= (Time.parse(Constant_class::TIME_END_NIGHT)))
						return false ## not circulate
					end									
				end
			end
		}
		return true #circulate
	end
end