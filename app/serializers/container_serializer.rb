class ContainerSerializer < ActiveModel::Serializer
  attributes :id,
             :type,
             :volume,
             :volume_unit,
             :name
end
