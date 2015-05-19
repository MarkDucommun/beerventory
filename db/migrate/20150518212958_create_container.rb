class CreateContainer < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :type, null: false
      t.integer :volume, null: false
      t.string :volume_unit, null: false
      t.string :name
      t.timestamps
    end
  end
end
