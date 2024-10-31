class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.references :conversation, null: false, foreign_key: true
      t.integer :caller
      t.integer :receiver
      t.string :call_type
      t.datetime :start_time
      t.datetime :end_time
      t.string :status

      t.timestamps
    end
  end
end
