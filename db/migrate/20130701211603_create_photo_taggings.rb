class CreatePhotoTaggings < ActiveRecord::Migration
  def change
    create_table :photo_taggings do |t|
      t.integer :photo_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :photo_taggings, :photo_id
    add_index :photo_taggings, :tag_id
  end
end
