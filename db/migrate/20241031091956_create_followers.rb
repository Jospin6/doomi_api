class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :vitrine, null: false, foreign_key: true
      t.integer :follower

      t.timestamps
    end
  end
end