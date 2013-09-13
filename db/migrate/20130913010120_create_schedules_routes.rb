class CreateSchedulesRoutes < ActiveRecord::Migration
  def change
    create_table :schedules_routes do |t|
      t.references :schedule
      t.references :route

      t.timestamps
    end
    add_index :schedules_routes, :schedule_id
    add_index :schedules_routes, :route_id
  end
end
