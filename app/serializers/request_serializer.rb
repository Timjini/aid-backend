class RequestSerializer < ActiveModel::Serializer
  attributes :id, :description, :address, :longitude, :latitude, :fulfillment, :kind, :situation,:created_at, :updated_at, :user, :fulfillments 
  belongs_to :user
  has_many :fulfillments
  def fulfillments
    object.fulfillments.limit(5)
  end
  
end
