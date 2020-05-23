class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.references :category, foreign_key: true
      t.text :subject
      t.text :memo
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
