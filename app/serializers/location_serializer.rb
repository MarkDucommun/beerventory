class LocationSerializer < ActiveModel::Serializer
  attributes :id,
             :container,
             :room
end
