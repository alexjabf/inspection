class CreateSchedulesHistories < ActiveRecord::Migration
  def change
    create_table :schedules_histories do |t|
      t.references :routes_history
      t.references :client_branch
      t.references :branch
      t.references :company
      t.boolean :visited,  :null => false, :default => false
      t.string :latitude,          :default => nil
      t.string :longitude,          :default => nil
      t.datetime :visited_at

      t.timestamps
    end
    add_index :schedules_histories, :routes_history_id
    add_index :schedules_histories, :client_branch_id
    add_index :schedules_histories, :branch_id
    add_index :schedules_histories, :company_id
  end
end
