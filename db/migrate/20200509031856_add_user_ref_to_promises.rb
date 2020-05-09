class AddUserRefToPromises < ActiveRecord::Migration[5.2]
  def change
    add_reference :promises, :user, foreign_key: true
  end
end
