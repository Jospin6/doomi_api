class RenameTypeToTypeVetementInVetementChaussures < ActiveRecord::Migration[7.0]
  def change
    rename_column :vetement_chaussures, :type, :type_vetement
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
