class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null:false
      t.string:password_digest, null:false
      t.string :last_name, null:false
      t.string :first_name, null:false
      t.string :sex
      t.string :material_status
      t.integer :birthday
      t.string :blood_type
      t.integer :partner_id
      t.text :image
      t.timestamps
    end
  end
end
