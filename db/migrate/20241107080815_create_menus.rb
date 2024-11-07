class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.references :restauration, null: false, foreign_key: true
      t.string :nom_plat
      t.text :description
      t.decimal :prix
      t.integer :categorie_plat
      t.text :ingredient

      t.timestamps
    end
  end
end
