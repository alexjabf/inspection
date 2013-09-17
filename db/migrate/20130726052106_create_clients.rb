class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
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
      t.references :company
      t.references :branch   
      t.timestamps
    end
    add_index :clients, :company_id
    add_index :clients, :branch_id
  end
end
