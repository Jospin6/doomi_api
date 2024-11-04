class CreateAutreProduitAttributs < ActiveRecord::Migration[7.0]
  def change
    create_table :autre_produit_attributs do |t|
      t.references :produit, null: false, foreign_key: true
      t.integer :etat
      t.string :marque

      t.timestamps
    end
  end
end
