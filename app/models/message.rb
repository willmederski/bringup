class Message < ActiveRecord::Base
  attr_accessible :body, :course_id, :send_date

  validates :send_date, uniqueness: {scope: :course_id}

  belongs_to :course
  belongs_to :teacher

end
