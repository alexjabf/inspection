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
      t.references :company
      t.references :branch      
      t.timestamps
    end
    add_index :cabins, :driver_id
    add_index :cabins, :truck_id
    add_index :cabins, :company_id
    add_index :cabins, :branch_id    
  end
end
