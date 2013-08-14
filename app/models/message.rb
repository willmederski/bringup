class Message < ActiveRecord::Base
  attr_accessible :body, :course_id, :send_date

  validates :send_date, uniqueness: {scope: :course_id}

  belongs_to :course
  belongs_to :teacher

  def as_json(options = {})
    {
      id:         self.id,
      course_id:  self.course_id,
      body:       self.body,
      send_date:  self.send_date.strftime('%-m/%-d/%Y'),
      teacher_id: self.teacher_id
    }
  end

end
