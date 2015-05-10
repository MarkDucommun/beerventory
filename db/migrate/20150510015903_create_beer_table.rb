class CreateBeerTable < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.datetime :purchase_date
      t.datetime :bottling_date
      t.datetime :best_by_date
      t.timestamps
    end
  end
end
