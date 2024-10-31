class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.text :message
      t.boolean :is_read
      t.references :produit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
