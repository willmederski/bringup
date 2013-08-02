class AddFirstNameAndLastNameToReplies < ActiveRecord::Migration
  def change
  	add_column :replies, :first_nm, :string
  	add_column :replies, :last_nm, :string
  	add_column :replies, :child_nm, :string
  	add_column :replies, :relationship, :string
  	add_column :replies, :delivery_time, :string
  	add_column :replies, :sms_status, :string
  end
end
