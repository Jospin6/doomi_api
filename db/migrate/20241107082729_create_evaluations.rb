class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.string :evaluationable_type
      t.integer :evaluationable_id
      t.references :user, null: false, foreign_key: true
      t.integer :evaluation

      t.timestamps
    end
  end
end
