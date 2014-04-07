class AddNameToStations < ActiveRecord::Migration
  def change
    change_column :stations, :name, :string
  end
end
