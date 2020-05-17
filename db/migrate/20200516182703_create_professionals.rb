class CreateProfessionals < ActiveRecord::Migration[5.2]
  def change
    create_table :professionals do |t|
      t.string :email, null:false
      t.string :password_digest, null:false
      t.string :last_name, null:false
      t.string :first_name, null:false
      t.string :sex
      t.string :category
      t.text :self_introduction
      t.text :service_name
      t.integer :price
      t.string :bank
      t.string :branch
      t.integer :branch_number
      t.string :acctount
      t.integer :account_number
      t.timestamps
    end
  end
end
