class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :app_name
      t.string :css
      t.string :owner_name
      t.string :meta_keywords
      t.string :meta_description
      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
