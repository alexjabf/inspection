class CreateElectricalSystems < ActiveRecord::Migration
  def change
    create_table :electrical_systems do |t|
      t.boolean :start_up
      t.boolean :accumulator
      t.boolean :lights
      t.text :observations
      t.references :driver
      t.references :truck
      t.references :company
      t.references :branch
      t.timestamps
    end
    add_index :electrical_systems, :driver_id
    add_index :electrical_systems, :truck_id    
    add_index :electrical_systems, :company_id
    add_index :electrical_systems, :branch_id    
  end
end
