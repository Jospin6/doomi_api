class CreateRestaurations < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurations do |t|
      t.string :nom
      t.integer :type_cuisine
      t.text :adresse
      t.text :contacts
      t.text :site_web
      t.integer :capacite
      t.text :horaires
      t.string :localisation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
