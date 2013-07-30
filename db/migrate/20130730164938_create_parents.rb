class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :class_code
      t.string :phone_number
      t.string :first_nm
      t.string :last_nm
      t.string :child_nm
      t.string :relationship
      t.string :delivery_time

      t.timestamps
    end
  end
end
