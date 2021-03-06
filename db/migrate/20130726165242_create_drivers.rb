class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.references :user
      t.references :truck
      t.references :branch
      t.references :company
      
      t.timestamps
    end
    add_index :drivers, :user_id
    add_index :drivers, :truck_id
    add_index :drivers, :branch_id
    add_index :drivers, :company_id    
  end
end
