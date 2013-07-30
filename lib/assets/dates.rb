module MessageDates

	def self.this_week 
		#checks to see what day of the week today is
		t = Time.now.wday
		#establishes Sunday as the first day of the week
		if t == 0
			@sunday = Time.now
		else
			@sunday = Time.now - t*(60*60*24)
		end
	end

end