class CreateEvenements < ActiveRecord::Migration[7.0]
  def change
    create_table :evenements do |t|
      t.references :produit, null: false, foreign_key: true
      t.date :date_evenement
      t.string :lieu
      t.integer :type_prix
      t.text :site_web
      t.integer :etat_evenement

      t.timestamps
    end
  end
end
