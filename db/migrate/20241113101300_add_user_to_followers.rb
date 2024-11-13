class AddUserToFollowers < ActiveRecord::Migration[7.0]
  def change
    add_reference :followers, :user, null: false, foreign_key: true
  end
end
