class RenameBeersTable < ActiveRecord::Migration
  def change
    rename_table :beers, :units
    remove_column :units, :name
    add_column :units, :container_id, :integer, null: false, index: true
  end
end
