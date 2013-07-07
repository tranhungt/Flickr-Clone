class AddUploadStatustoPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :uploading, :boolean 
  end
end
