class RemoveSenderFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :sender, :integer
  end
end
