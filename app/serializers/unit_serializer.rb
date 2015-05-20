class UnitSerializer < ActiveModel::Serializer
  attributes :id,
             :bottling_date,
             :purchase_date,
             :best_by_date

  has_one :beer
  has_one :container
end
