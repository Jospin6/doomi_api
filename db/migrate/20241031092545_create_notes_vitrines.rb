class CreateNotesVitrines < ActiveRecord::Migration[7.0]
  def change
    create_table :notes_vitrines do |t|
      t.references :vitrine, null: false, foreign_key: true
      t.integer :client
      t.integer :note

      t.timestamps
    end
  end
end
