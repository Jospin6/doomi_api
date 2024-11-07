class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :titre
      t.string :type
      t.text :message
      t.boolean :is_read
      t.datetime :date_expiration
      t.integer :priorite
      t.string :notificationable_type
      t.integer :notificationable_id

      t.timestamps
    end
  end
end
