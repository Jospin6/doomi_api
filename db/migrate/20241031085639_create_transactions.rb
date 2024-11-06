class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :produit, null: false, foreign_key: true
      t.integer :acheteur
      t.integer :notes, default: 0
      t.string :status, default: "en cours"

      t.timestamps
    end
  end
end
