class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :number
      t.timestamps
    end
    create_table :stations do |t|
      t.integer :name
      t.timestamps
    end
    create_table :stops do |t|
      t.integer :line_id
      t.integer :station_id
      t.timestamps
    end

  end
end
