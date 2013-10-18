class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :protected,  :null => false, :default => false
      t.boolean :super_admin,  :null => false, :default => false
      t.boolean :company_admin,  :null => false, :default => false      
      t.boolean :branch_admin,  :null => false, :default => false
      t.boolean :routes_admin,  :null => false, :default => false
      t.boolean :driver,  :null => false, :default => false   
      t.text :description
      t.references :branch
      t.references :company
      t.timestamps
    end
    add_index :roles, :branch_id
    add_index :roles, :company_id    
  end
end
