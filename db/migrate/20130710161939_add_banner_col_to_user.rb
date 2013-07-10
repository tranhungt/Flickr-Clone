class AddBannerColToUser < ActiveRecord::Migration
  def change
    add_attachment :users, :banner
  end
end
