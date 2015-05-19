class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.belongs_to :brewery, null: false
      t.timestamps
    end
  end
end
