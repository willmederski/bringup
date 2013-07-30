class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :message_id
      t.string :date_created
      t.string :date_updated
      t.string :account_sid
      t.string :from
      t.text :body
      t.string :direction
      t.float :price
      t.string :price_unit
      t.string :api_version
      t.string :uri

      t.timestamps
    end
  end
end
