class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.references :produit, null: false, foreign_key: true
      t.string :statut
      t.decimal :evaluation_moyenne
      t.integer :nombre_evaluation

      t.timestamps
    end
  end
end
