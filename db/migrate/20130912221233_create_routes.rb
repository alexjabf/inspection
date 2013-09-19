class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.references :schedule
      t.references :company      
      t.references :branch
      t.timestamps
    end
    add_index :routes, :schedule_id
    add_index :routes, :branch_id
    add_index :routes, :company_id
  end
end
