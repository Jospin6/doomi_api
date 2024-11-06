class CreateRecommandations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommandations do |t|
      t.string :recommandable_type
      t.integer :recommandable_id
      t.text :contenu
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
