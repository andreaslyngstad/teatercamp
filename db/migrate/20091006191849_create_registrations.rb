class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string :name
      t.integer :age
      t.string :parent_one_name
      t.string :parent_two_name
      t.string :parent_one_phone
      t.string :parent_two_phone
      t.string :billing_email
      t.text :tell
      t.text :medical
      t.integer :camp_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
