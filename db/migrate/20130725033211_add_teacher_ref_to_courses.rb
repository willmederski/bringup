class AddTeacherRefToCourses < ActiveRecord::Migration
	def change
    add_reference :courses, :teacher, index: true
    remove_column :courses, :teacher_id, :integer
  end
end
