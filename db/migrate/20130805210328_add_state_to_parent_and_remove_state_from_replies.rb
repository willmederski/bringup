class AddStateToParentAndRemoveStateFromReplies < ActiveRecord::Migration
  def change
    add_column :parents, :state, :string
    remove_column :replies, :status
  end
end
