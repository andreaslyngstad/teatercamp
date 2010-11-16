class CreateCamps < ActiveRecord::Migration
  def self.up
    create_table :camps do |t|
      t.string :name
      t.string :description
      t.integer :age1
      t.integer :age2
      t.datetime :begin
      t.datetime :end
      t.integer :participants      
      t.timestamps
    end
  end

  def self.down
    drop_table :camps
  end
end
