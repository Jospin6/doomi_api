class CreateALaUnes < ActiveRecord::Migration[7.0]
  def change
    create_table :a_la_unes do |t|
      t.string :a_la_uneable_type
      t.integer :a_la_uneable_id
      t.references :user, null: false, foreign_key: true
      t.datetime :date_debut
      t.datetime :date_fin
      t.decimal :cout
      t.string :statut

      t.timestamps
    end
  end
end
