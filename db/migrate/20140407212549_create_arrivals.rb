class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.integer :bus_id
      t.integer :stop_id
      t.time :time
      t.timestamps
    end
    create_table :buses do |t|
      t.string :name
      t.integer :line_id
      t.timestamps
    end
  end
end
