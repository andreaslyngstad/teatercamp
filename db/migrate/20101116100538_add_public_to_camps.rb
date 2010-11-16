class AddPublicToCamps < ActiveRecord::Migration
  def self.up
    add_column :camps, :public, :boolean
    
  end

  def self.down
    remove_column :camps, :public
  end
end
