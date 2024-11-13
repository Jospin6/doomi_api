class RemoveReceiverFromCalls < ActiveRecord::Migration[7.0]
  def change
    remove_column :calls, :caller, :integer
    remove_column :calls, :receiver, :integer
  end
end
