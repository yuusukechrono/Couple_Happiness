class AddColumnProfessionals < ActiveRecord::Migration[5.2]
  def change
    add_column :professionals, :image, :string
  end
end
