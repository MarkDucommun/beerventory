class BeerSerializer < ActiveModel::Serializer
  attributes :name,
             :bottling_date,
             :purchase_date,
             :best_by_date
end
