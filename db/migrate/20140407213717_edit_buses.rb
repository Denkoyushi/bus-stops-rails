class EditBuses < ActiveRecord::Migration
  def change
    remove_column :buses, :name
  end
end
