class CreatePaiements < ActiveRecord::Migration[7.0]
  def change
    create_table :paiements do |t|
      t.references :transaction, null: false, foreign_key: true
      t.string :mode
      t.decimal :montant

      t.timestamps
    end
  end
end
