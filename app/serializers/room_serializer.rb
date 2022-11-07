class RoomSerializer < ActiveModel::Serializer
  attributes :id
  has_many :tweets
  has_many :users
end
