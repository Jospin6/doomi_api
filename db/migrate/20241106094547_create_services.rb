class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.references :produit, null: false, foreign_key: true
      t.string :statut

      t.timestamps
    end
  end
end
