class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :produit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date_reservation
      t.string :statut

      t.timestamps
    end
  end
end
