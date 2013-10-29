class CreateRoutesHistories < ActiveRecord::Migration
  def change
    create_table :routes_histories do |t|
      t.references :driver
      t.references :company
      t.references :branch
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :initial_km
      t.integer :final_km
      t.string :start_latitude,          :default => nil
      t.string :start_longitude,          :default => nil
      t.string :end_latitude,          :default => nil
      t.string :end_longitude,          :default => nil      
      t.boolean :closed,  :null => false, :default => false
      t.string :weekday

      t.timestamps
    end
    add_index :routes_histories, :driver_id
    add_index :routes_histories, :company_id
    add_index :routes_histories, :client_branch_id
  end
end
