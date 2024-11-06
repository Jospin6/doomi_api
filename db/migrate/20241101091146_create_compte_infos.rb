class CreateCompteInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :compte_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :confirmation_code, null: true
      t.datetime :confirmed_at, null: true
      t.string :rccm, null: true, default: ""
      t.string :langue, null: true, default: ""

      t.timestamps
    end
  end
end
