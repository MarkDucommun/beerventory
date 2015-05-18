class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
