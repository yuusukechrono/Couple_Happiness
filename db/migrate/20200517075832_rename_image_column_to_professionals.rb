class RenameImageColumnToProfessionals < ActiveRecord::Migration[5.2]
  def change
    rename_column :professionals, :image, :professional_image
  end
end
