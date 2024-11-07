class CreateBoosts < ActiveRecord::Migration[7.0]
  def change
    create_table :boosts do |t|
      t.string :boostable_type
      t.integer :boostable_id
      t.references :user, null: false, foreign_key: true
      t.datetime :date_debut
      t.datetime :date_fin
      t.decimal :cout
      t.string :statut

      t.timestamps
    end
  end
end
