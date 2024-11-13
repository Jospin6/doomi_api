class RemoveFollowerFromFollowers < ActiveRecord::Migration[7.0]
  def change
    remove_column :followers, :follower, :integer
  end
end
