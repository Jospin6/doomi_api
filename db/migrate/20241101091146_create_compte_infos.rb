class CreateCompteInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :compte_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :type_compte
      t.string :confirmation_code, null: true
      t.datetime :confirmed_at, null: true

      t.timestamps
    end
  end
end
