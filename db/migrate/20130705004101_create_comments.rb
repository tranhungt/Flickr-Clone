class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :photo_id
      t.integer :comment_id
      t.string :body

      t.timestamps
    end
  end
end
