class CreateUserMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :user_matches do |t|
      t.integer :confirmation_status
      t.datetime :confirmation_date
      t.references :party
      t.references :partner

      t.timestamps
    end
    add_foreign_key :user_matches, :users, column: :party_id
    add_foreign_key :user_matches, :users, column: :partner_id
  end
end
