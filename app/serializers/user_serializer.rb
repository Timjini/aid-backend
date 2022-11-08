class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :email, :created_at, :updated_at, :requests, :fulfillments

    has_many :fulfillments
    has_many :requests

end