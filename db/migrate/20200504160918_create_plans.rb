class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.datetime :plan_date
      t.text :detail
      t.timestamps
    end
  end
end
