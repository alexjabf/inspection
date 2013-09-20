class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :company      
      t.references :branch
      t.references :driver
      t.references :client
      t.references :client_branch
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :week_day

      t.timestamps
    end
    add_index :schedules, :company_id    
    add_index :schedules, :branch_id
    add_index :schedules, :driver_id
    add_index :schedules, :client_id
    add_index :schedules, :client_branch_id
  end
end
