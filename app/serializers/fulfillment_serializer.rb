
class FulfillmentSerializer < ActiveModel::Serializer
    attributes :id, :user_id , :text , :request_id, :created_at, :updated_at, :user, :request, :messages
    belongs_to :request
    belongs_to :user
    has_many :messages
  end
