class AddStateToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :state, :string
    remove_column :replies, :first_nm
    remove_column :replies, :last_nm
    remove_column :replies, :child_nm
    remove_column :replies, :relationship
    remove_column :replies, :delivery_time
    remove_column :replies, :sms_status
  end
end
