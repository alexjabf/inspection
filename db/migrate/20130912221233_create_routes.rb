class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.references :schedule

      t.timestamps
    end
    add_index :routes, :schedule_id
  end
end
