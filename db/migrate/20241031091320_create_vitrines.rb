class CreateVitrines < ActiveRecord::Migration[7.0]
  def change
    create_table :vitrines do |t|
      t.string :titre
      t.text :description
      t.string :profil_img
      t.string :cover_img
      t.text :specialites
      t.text :horaires
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
