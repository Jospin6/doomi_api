class CreateProjets < ActiveRecord::Migration[7.0]
  def change
    create_table :projets do |t|
      t.references :service, null: false, foreign_key: true
      t.string :titre
      t.text :description

      t.timestamps
    end
  end
end
