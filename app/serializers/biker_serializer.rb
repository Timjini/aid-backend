class BikerSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :city_of_origin, :state_of_origin, :latitude, :longitude, :created_at, :updated_at
end