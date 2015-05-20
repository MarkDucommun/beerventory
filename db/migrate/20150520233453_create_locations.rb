class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :container, null: false
      t.string :room, null: false
      t.timestamps
    end
  end
end
