class CreateCabins < ActiveRecord::Migration
  def change
    create_table :cabins do |t|
      t.boolean :crystals
      t.boolean :mirrors
      t.boolean :elevators
      t.boolean :door_locks
      t.boolean :doors
      t.text :observations
      t.references :driver
      t.references :truck
      t.timestamps
    end
    add_index :cabins, :driver_id
    add_index :cabins, :truck_id    
  end
end
