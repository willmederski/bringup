class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :course
      t.string :body
      t.date :send_date

      t.timestamps
    end
  end
end
