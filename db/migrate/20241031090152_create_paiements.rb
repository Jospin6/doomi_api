class CreatePaiements < ActiveRecord::Migration[7.0]
  def change
    create_table :paiements do |t|
      t.string :paiementable_type
      t.integer :paiementable_id
      t.string :mode
      t.decimal :montant

      t.timestamps
    end
  end
end
