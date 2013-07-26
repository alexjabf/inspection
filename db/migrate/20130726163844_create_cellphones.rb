class CreateCellphones < ActiveRecord::Migration
  def change
    create_table :cellphones do |t|
      t.string :phone_number
      t.string :model
      t.string :brand
      t.string :color
      t.string :ope_system
      t.text :condition
      t.string :imei
      t.text :description
      t.references :user
      t.references :branch

      t.timestamps
    end
    add_index :cellphones, :user_id
    add_index :cellphones, :branch_id
  end
end
