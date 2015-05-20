class AddBeerIdToUnit < ActiveRecord::Migration
  def change
    add_column :units, :beer_id, :integer, null: false, index: true
  end
end
