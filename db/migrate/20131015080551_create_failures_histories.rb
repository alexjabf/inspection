class CreateFailuresHistories < ActiveRecord::Migration
  def change
    create_table :failures_histories do |t|
      t.references :routes_history
      t.integer :failure_id
      t.string :failure_type

      t.timestamps
    end
    add_index :failures_histories, :routes_history_id
  end
end
