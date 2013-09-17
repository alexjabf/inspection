class CreateClientBranches < ActiveRecord::Migration
  def change
    create_table :client_branches do |t|
      t.string :name
      t.string :email1
      t.string :email2
      t.string :webpage
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.text :description
      t.references :client
      t.references :branch
      t.references :company      
      t.timestamps
    end
    add_index :client_branches, :client_id
    add_index :client_branches, :branch_id
    add_index :client_branches, :company_id    
  end
end
