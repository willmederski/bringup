class Teacher < ActiveRecord::Base
  attr_accessible :email, :full_name, :phone, :preferred_name, :principal_name, :school, :password, :password_confirmation, :remember_me
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :full_name, :phone, :preferred_name, :principal_name, :school, :password, :password_confirmation, presence: true

  has_many :courses
  has_many :messages
  has_one :school
  
  def school
  	school.try(:school_name)
  end

  def school=(school_name)
  	self.school=School.find_by_or_create_school_name(school_name) if school.present?
  end


end
