class CreateCoordonnes < ActiveRecord::Migration[7.0]
  def change
    create_table :coordonnes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :ville
      t.string :pays
      t.string :lat_lon

      t.timestamps
    end
  end
end
