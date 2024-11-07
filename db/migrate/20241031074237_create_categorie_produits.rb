class CreateCategorieProduits < ActiveRecord::Migration[7.0]
  def change
    create_table :categorie_produits do |t|
      t.string :titre
      t.text :description
      t.string :image
      t.timestamps
      
    end
  end
end
