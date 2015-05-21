class AddStickerAndIdentifierToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :identifier, :string, unique: true, index: true
    add_column :locations, :sticker_color, :string, unique: true, index: true
  end
end
