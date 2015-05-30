class BeerSerializer < ActiveModel::Serializer
  attributes :id,
             :name

  has_one :brewery
  has_one :style
end
