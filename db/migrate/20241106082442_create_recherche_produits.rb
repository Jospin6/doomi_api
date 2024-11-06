class CreateRechercheProduits < ActiveRecord::Migration[7.0]
  def change
    create_table :recherche_produits do |t|
      t.string :libele
      t.references :user, null: false, foreign_key: true
      t.datetime :date_heure
      t.integer :resultats
      t.string :localisation

      t.timestamps
    end
  end
end
