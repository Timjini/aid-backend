class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :email, :created_at, :updated_at, :requests, :fulfillments
    has_many :tweets

    has_many :fulfillments
    has_many :requests
    has_many :rooms

end