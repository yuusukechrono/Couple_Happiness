class AddCategoryRefToPromises < ActiveRecord::Migration[5.2]
  def change
    add_reference :promises, :category, foreign_key: true
  end
end
