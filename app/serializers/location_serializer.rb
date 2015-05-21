class LocationSerializer < ActiveModel::Serializer
  attributes :id,
             :container,
             :room,
             :identifier,
             :sticker_color
end
