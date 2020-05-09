class CreatePromises < ActiveRecord::Migration[5.2]
  def change
    create_table :promises do |t|
      t.text :detail
      t.timestamps
    end
  end
end
