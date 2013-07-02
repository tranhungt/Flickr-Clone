class CreatePhotoSets < ActiveRecord::Migration
  def change
    create_table :photo_sets do |t|
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
