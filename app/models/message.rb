class Message < ActiveRecord::Base
  attr_accessible :body, :course_id, :send_date

  belongs_to :course
  belongs_to :teacher

end
