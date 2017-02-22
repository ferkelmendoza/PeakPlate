require './Logic/Circulation.rb'
require './Logic/Validation.rb'
require 'time'


	@circulation = Circulation.new
	@valid_data = Validation.new
	@isCorrect = false
	@day = Time.now

	puts "--------------------"
	puts "PEAK && PLATE"
	puts "--------------------"
	puts ""
	puts "HOURS NOT ALLOWED FOR VEHICLE CIRCULATION"
	puts " 7:00 a.m. to 9:30 a.m. "
	puts " 16:00 p.m. to 19:30 p.m. "
	puts ""
	puts "The last digit of the Enrollment can not circulate in the following days:"
	puts "– Monday:	1 y 2"
	puts "– Tuesday: 	3 y 4"
	puts "– Wednesday: 	5 y 6"
	puts "– Thursday: 	7 y 8"
	puts "– Friday: 	9 y 0"
	
	
	
	
	
	def in_Enrollment   
		while @isCorrect == false 
			puts "Enter Registration Example PQR-1395:"
			@circulation.enrollment = gets.chomp
			puts ""
			@isCorrect = @valid_data.valid_enrollment(@circulation.enrollment)
			if !@isCorrect
				puts(@valid_data.message)
			end
		end
		@isCorrect = false
	end 

	
	def in_Date_circulation
		while @isCorrect == false
			puts "Enter Date Example 25/01/2017(dd/mm/yyyy):"
			@circulation.date_circulation = gets.chomp
			
			puts ""
			@isCorrect = @valid_data.valid_date(@circulation.date_circulation)
			if !@isCorrect
				puts(@valid_data.message)
			end
		end
		@isCorrect = false
	end
	 
	 
	 def in_Hora
		while @isCorrect == false
			puts "Enter Time 00:00 - 20:17 (hh:mm)"
			@circulation.hour_circulation = Time.new 
			@circulation.hour_circulation = gets.chomp
			puts ""
			@isCorrect = @valid_data.valid_Hour(@circulation.hour_circulation)
			if !@isCorrect
				puts(@valid_data.message)
			end	
		end
		@isCorrect = false
	end
	
	##Execution methods##
	in_Enrollment
	in_Date_circulation
	in_Hora
	@isCorrect=@circulation.valid_Circulation(@circulation)
	##Execution methods##

	puts ""
	puts "------Data entered -------"
	puts "Hour:		"+@circulation.hour_circulation.to_s
	puts "Day:		"+@circulation.date_circulation
	puts "Last digit:	"+@circulation.enrollment.reverse[0,1].to_s
	puts ""

	if(@isCorrect)
		puts ""
		puts "Your car can drive through the streets of Quito without a problem"
		puts ""
	else
		puts ""
		puts "!!! Your vehicle can NOT circulate in the streets !!!"
		puts ""
	end




