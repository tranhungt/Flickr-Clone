class ChangeDefaultValueofSavedColumnsOnPhotos < ActiveRecord::Migration
  def up
  	change_column :photos, :saved, :boolean, :default => false
  end

  def down
  	change_column :photos, :saved, :boolean, :default => nil
  end
end
