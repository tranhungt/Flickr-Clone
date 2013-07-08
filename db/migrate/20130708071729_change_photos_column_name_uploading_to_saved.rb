class ChangePhotosColumnNameUploadingToSaved < ActiveRecord::Migration
  def change
    rename_column :photos, :uploading, :saved
  end
end
