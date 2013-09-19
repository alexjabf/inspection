class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :protected
      t.boolean :super_admin
      t.boolean :branch_admin
      t.boolean :routes_admin
      t.boolean :driver
      t.text :description
      t.references :branch
      t.references :company
      t.timestamps
    end
    add_index :roles, :branch_id
    add_index :roles, :company_id    
  end
end
