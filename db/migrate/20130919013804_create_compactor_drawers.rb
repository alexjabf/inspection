class CreateCompactorDrawers < ActiveRecord::Migration
  def change
    create_table :compactor_drawers do |t|
      t.boolean :iron
      t.boolean :curtain
      t.boolean :shovel
      t.boolean :floor
      t.boolean :walls
      t.boolean :roof
      t.text :observations
      t.references :driver
      t.references :truck

      t.timestamps
    end
    add_index :compactor_drawers, :driver_id
    add_index :compactor_drawers, :truck_id    
  end
end
