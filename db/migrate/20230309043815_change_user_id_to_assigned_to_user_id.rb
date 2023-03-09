class ChangeUserIdToAssignedToUserId < ActiveRecord::Migration[7.0]
  def change
    change_table :notes do |t|
      t.rename :user_id, :assigned_to_user_id
    end
  end
end
