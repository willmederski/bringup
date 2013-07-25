class Course < ActiveRecord::Base
  attr_accessible :name, :twilio_id
  
  belongs_to :teacher

  before_create do |course|
  	course[:twilio_id]="2909489"	
  end

end
