class AddsIdentifierAndStickerToUnit < ActiveRecord::Migration
  def change
    add_column :units, :identifier, :string, unique: true, index: true
    add_column :units, :sticker_color, :string, unique: true, index: true
  end
end
