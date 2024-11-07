class CreateHotellerieServices < ActiveRecord::Migration[7.0]
  def change
    create_table :hotellerie_services do |t|
      t.string :nom_hotel
      t.string :type_hebergement
      t.text :adresse
      t.text :contacts
      t.text :email
      t.text :site_web
      t.integer :nombre_chambres
      t.integer :capacite_accueil
      t.decimal :tarif_moyen
      t.text :horaires
      t.string :localisation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
