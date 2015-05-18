class BrewerySerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :city,
             :state
end
