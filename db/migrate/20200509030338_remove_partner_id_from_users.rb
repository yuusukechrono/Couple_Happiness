class RemovePartnerIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :partner_id, :integer
  end
end
