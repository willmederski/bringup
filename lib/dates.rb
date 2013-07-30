module MessageDates

	class Week

	def self.this_week 
		#checks to see what day of the week today is
		t = Time.now.wday
		#establishes Monday as the first day of the work week
		if t == 0
			@monday = Time.now + (60*60*24)
		elsif t == 1
			@monday = Time.now
		else
			@monday = Time.now - t*(60*60*24)
		end
	end

	end

	def self.execute
		Week.this_week
	end



end