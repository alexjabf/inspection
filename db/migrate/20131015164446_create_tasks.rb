class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :driver
      t.references :branch
      t.references :company
      t.boolean :completed,  :null => false, :default => false
      t.string :priority
      t.date :scheduled_date
      t.float :latitude
      t.float :longitude
      t.text :description
      t.text :comments
      t.datetime :completed_at

      t.timestamps
    end
    add_index :tasks, :driver_id
    add_index :tasks, :branch_id
    add_index :tasks, :company_id
  end
end
