require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  describe Teacher do
  	context "When a new teacher record is created" do
		let(:teacher) {Teacher.new 'teacher@gmail.com', 'Sally Teacher', 'Ms. Teacher', 'Mr. Principal,', 'Sunny Day School', 'password', 'password'}
		expect teacher.email=='teacher@gmail.com'  
		expect teacher.full_name=='Sally Teacher'
		expect teacher.preferred_name=='Ms. Teacher'
		expect teacher.principal=='Mr. Principal'
		expect teacher.school=='Sunny Day School'
		expect teacher.password=='password'
		expect teacher.password_confirmation=='password'

  # test "the truth" do
  #   assert true
  # end
end
