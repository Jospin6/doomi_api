class CreateProduits < ActiveRecord::Migration[7.0]
  def change
    create_table :produits do |t|
      t.string :titre
      t.decimal :prix
      t.text :description
      t.integer :devise
      t.boolean :is_visible, default: true
      t.string :localisation
      t.references :sub_categorie_produit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
