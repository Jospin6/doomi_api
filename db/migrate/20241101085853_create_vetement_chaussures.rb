class CreateVetementChaussures < ActiveRecord::Migration[7.0]
  def change
    create_table :vetement_chaussures do |t|
      t.references :produit, null: false, foreign_key: true
      t.integer :type
      t.integer :taille
      t.integer :matiere

      t.timestamps
    end
  end
end
