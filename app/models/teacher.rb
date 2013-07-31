class Teacher < ActiveRecord::Base
  attr_accessible :email, :full_name, :phone, :preferred_name, :principal_name, :school, :password, :password_confirmation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :full_name, :phone, :preferred_name, :principal_name, :school, :password, :password_confirmation, presence: true

  has_many :courses
  has_many :messages
  
end
