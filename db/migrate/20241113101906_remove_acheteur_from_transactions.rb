class RemoveAcheteurFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :acheteur, :integer
    add_reference :transactions, :user, null: false, foreign_key: true
  end
end
