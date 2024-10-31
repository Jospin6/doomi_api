class CreateFavorieProduits < ActiveRecord::Migration[7.0]
  def change
    create_table :favorie_produits do |t|
      t.references :produit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
