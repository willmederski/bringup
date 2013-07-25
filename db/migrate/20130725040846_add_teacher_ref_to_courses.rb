class AddTeacherRefToCourses < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.references :teacher
    end
  end
end

