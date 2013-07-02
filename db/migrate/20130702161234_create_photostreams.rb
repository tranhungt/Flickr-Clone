class CreatePhotostreams < ActiveRecord::Migration
  def change
    create_table :photostreams do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
