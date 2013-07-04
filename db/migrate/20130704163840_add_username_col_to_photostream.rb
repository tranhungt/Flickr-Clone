class AddUsernameColToPhotostream < ActiveRecord::Migration
  def change
    add_column :photostreams, :username, :string
  end
end
