class AddLocationToUnit < ActiveRecord::Migration
  def change
    add_column :units, :location_id, :integer
  end
end
