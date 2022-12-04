class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at, :user, :fulfillment
  belongs_to :user
  belongs_to :fulfillment
end