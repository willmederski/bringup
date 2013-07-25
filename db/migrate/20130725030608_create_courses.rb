class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :twilio_id
      t.string :name
      t.integer :teacher_id

      t.timestamps
    end
  end
end
