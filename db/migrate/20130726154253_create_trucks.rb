class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :model
      t.string :brand
      t.integer :year
      t.string :truck_type
      t.string :plate_no
      t.string :serial_no
      t.string :color
      t.integer :wheels_no
      t.string :other
      t.string :identifier
      t.references :branch
      t.references :company 

      t.timestamps
    end
    add_index :trucks, :branch_id
    add_index :trucks, :company_id    
  end
end
