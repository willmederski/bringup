class Parent < ActiveRecord::Base
  attr_accessible :child_nm, :class_code, :delivery_time, :first_nm, :last_nm, :phone_number, :relationship
  state_machine initial: :course_num_and_phone do
 		event :added_course_number_and_phone do
	 		transition :course_num_and_phone=> :first_nm
	 	end

 		event :added_first_name do
	 		transition :first_nm => :last_nm
	 	end	 	

	 	event :added_last_name do
	 		transition :last_nm => :child_nm
	 	end

	 	event :added_child_name do
	 		transition :child_nm => :relationship
	 	end

	 	event :added_relationship do
	 		transition :relationship => :delivery_time
	 	end

	 	event :added_delivery_time do
	 		transition :delivery_time => :sign_off
	 	end

	 	# TODO: commented out because have not created method validate_course_number
	 	# before_transition :course_num_and_phone => :first_nm do |reply|
	 	# #check to see if parent has entered a valid course number
	 	# 	reply.validate_course_number
	 	# end
  end
end
