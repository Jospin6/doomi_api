class AddUserToCalls < ActiveRecord::Migration[7.0]
  def change
    add_column :calls, :user1_id, :integer
    add_column :calls, :user2_id, :integer
  end
end
