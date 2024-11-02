class AddImagesToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :images, :text, array: true, default: []
  end
end
