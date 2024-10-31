class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :conversation, null: false, foreign_key: true
      t.integer :sender
      t.text :body, null: true
      t.string :audio_file, null: true
      t.boolean :is_read

      t.timestamps
    end
  end
end
