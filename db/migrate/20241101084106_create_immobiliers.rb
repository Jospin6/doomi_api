class CreateImmobiliers < ActiveRecord::Migration[7.0]
  def change
    create_table :immobiliers do |t|
      t.references :produit, null: false, foreign_key: true
      t.integer :type_de_bien
      t.string :adresse
      t.string :surface_habitable
      t.integer :nombre_chambres
      t.integer :nombre_pieces

      t.timestamps
    end
  end
end
