class RemoveStatusFromReplies < ActiveRecord::Migration
  def up
    remove_column :replies, :status
  end
end
