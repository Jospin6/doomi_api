class CreateEmplois < ActiveRecord::Migration[7.0]
  def change
    create_table :emplois do |t|
      t.references :produit, null: false, foreign_key: true
      t.integer :type_contrat
      t.string :lieu
      t.string :secteur_activite
      t.integer :niveau_experience
      t.date :date_limite
      t.decimal :salaire
      t.text :site_web
      t.text :formation_requise
      t.integer :etat_offre

      t.timestamps
    end
  end
end
