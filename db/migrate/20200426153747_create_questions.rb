class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :detail
      t.string :answer_right
      t.string :answer_left
      t.integer :beginner
      t.timestamps
    end
  end
end
