class AddPhotoStreamColumnToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photostream_id, :integer
    add_index :photos, :photostream_id
  end
end
