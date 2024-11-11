class CreateVehicules < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicules do |t|
      t.references :produit, null: false, foreign_key: true
      t.string :modele
      t.integer :annee
      t.string :kilometrage
      t.integer :type_vehicule
      t.string :couleur
      t.string :carburant
      t.string :transmission
      t.integer :nombre_portes
      t.integer :nombre_places
      t.integer :statut
      t.integer :plan_de_paiement
      t.integer :disponibilite

      t.timestamps
    end
  end
end
