class AddSetAndUserIdColumnsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :user_id, :integer
    add_column :photos, :set_id, :integer
    add_index :photos, :user_id
    add_index :photos, :set_id
  end
end
