class Teacher < ActiveRecord::Base
  attr_accessible :email, :full_name, :phone, :preferred_name, :principal_name, :school_name, :password, :password_confirmation, :remember_me
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :full_name, :phone, :preferred_name, :principal_name, :school_name, :password, :password_confirmation, presence: true
  validates_length_of :phone, :maximum => 10
  validates_length_of :phone, :minimum => 10
  has_many :courses
  has_many :messages
  belongs_to :school

  before_create do |teacher|
    teacher.phone = "+1" + teacher.phone
  end

  after_create :find_or_create_school

  def find_or_create_school
    School.find_or_create_by_school_name(self.school_name)
  end


end
