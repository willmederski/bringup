class Course < ActiveRecord::Base
  attr_accessible :name, :twilio_id, :teacher_id
  
  belongs_to :teacher
  has_many :messages

  before_create do |course|
  	course[:twilio_id]=:id	
  end

end
