class UnitSerializer < ActiveModel::Serializer
  attributes :id,
             :identifier,
             :sticker_color,
             :bottling_date,
             :purchase_date,
             :best_by_date,
             :note

  has_one :beer
  has_one :container
  has_one :location
end
