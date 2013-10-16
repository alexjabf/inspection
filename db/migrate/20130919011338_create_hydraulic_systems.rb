class CreateHydraulicSystems < ActiveRecord::Migration
  def change
    create_table :hydraulic_systems do |t|
      t.boolean :car_jack
      t.boolean :hoses
      t.boolean :pump
      t.boolean :pto
      t.boolean :valve_box
      t.boolean :joystick
      t.text :observations
      t.references :driver
      t.references :truck
      t.references :company
      t.references :branch
      t.references :company
      t.references :branch      
      t.timestamps
    end
    add_index :hydraulic_systems, :driver_id
    add_index :hydraulic_systems, :truck_id
    add_index :hydraulic_systems, :company_id
    add_index :hydraulic_systems, :branch_id    
  end
end
