class CreateSubCategorieProduits < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_categorie_produits do |t|
      t.references :categorie_produit, null: false, foreign_key: true
      t.string :titre
      t.text :description
      
      t.timestamps
    end
  end
end
