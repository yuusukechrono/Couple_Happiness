class CreateConsultationRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :consultation_rooms do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps
    end
    add_index :consultation_rooms, :sender_id
    add_index :consultation_rooms, :recipient_id
  end
end
