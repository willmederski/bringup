class AddStatusToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :status, :string
  end
end
