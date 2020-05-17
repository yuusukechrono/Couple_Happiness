class RenameAcctountColumnToProfessional < ActiveRecord::Migration[5.2]
  def change
    rename_column :professionals, :acctount, :account
  end
end
