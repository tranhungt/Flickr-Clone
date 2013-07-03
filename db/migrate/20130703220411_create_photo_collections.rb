class CreatePhotoCollections < ActiveRecord::Migration
  def change
    create_table :photo_collections do |t|
      t.integer :collection_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
