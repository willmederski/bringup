class AddTeacherRefToMessages < ActiveRecord::Migration
  def change
  	change_table :messages do |t|
      t.references :teacher
  end
  end
end
