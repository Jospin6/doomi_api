class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :reservationable_type
      t.integer :reservationable_id
      t.references :user, null: false, foreign_key: true
      t.datetime :date_reservation
      t.string :statut

      t.timestamps
    end
  end
end
