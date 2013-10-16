class CreateDriveSystems < ActiveRecord::Migration
  def change
    create_table :drive_systems do |t|
      t.boolean :engine
      t.boolean :bands
      t.boolean :injection
      t.boolean :transmission
      t.boolean :arrows
      t.boolean :yokes
      t.boolean :differential
      t.text :observations
      t.references :driver
      t.references :truck
      t.references :company
      t.references :branch
      t.timestamps
    end
    add_index :drive_systems, :driver_id
    add_index :drive_systems, :truck_id
    add_index :drive_systems, :company_id
    add_index :drive_systems, :branch_id    
  end
end
