class CreateSericesDisponibleHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :serices_disponible_hotels do |t|
      t.references :hotellerie_service, null: false, foreign_key: true
      t.string :nom_service
      t.text :description
      t.integer :statut
      t.decimal :cout

      t.timestamps
    end
  end
end
