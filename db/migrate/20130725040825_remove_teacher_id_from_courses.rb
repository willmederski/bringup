class RemoveTeacherIdFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :teacher_id
  end

  def down
    add_column :courses, :teacher_id, :integer
  end
end
