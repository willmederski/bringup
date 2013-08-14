class ChangeSchoolToSchoolNameForTeachers < ActiveRecord::Migration
  def change
  	rename_column :teachers, :school, :school_name
  end
end
