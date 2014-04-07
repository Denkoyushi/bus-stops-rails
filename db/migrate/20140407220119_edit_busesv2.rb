class EditBusesv2 < ActiveRecord::Migration
  def change
    add_column :buses, :name, :string
  end
end
