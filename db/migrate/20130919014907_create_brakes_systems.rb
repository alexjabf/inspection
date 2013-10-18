class CreateBrakesSystems < ActiveRecord::Migration
  def change
    create_table :brakes_systems do |t|
      t.boolean :compressor
      t.boolean :bands
      t.boolean :hoses
      t.boolean :valve
      t.boolean :palancon
      t.boolean :dual
      t.boolean :double_chambers
      t.boolean :balata
      t.boolean :drums
      t.boolean :mass
      t.text :observations
      t.references :driver
      t.references :truck
      t.references :company
      t.references :branch
      t.timestamps
    end
    add_index :brakes_systems, :driver_id
    add_index :brakes_systems, :truck_id    
    add_index :brakes_systems, :company_id
    add_index :brakes_systems, :branch_id    
  end
end
