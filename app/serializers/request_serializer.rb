class RequestSerializer < ActiveModel::Serializer
  attributes :id, :description, :address, :longitude, :latitude, :fulfillment, :kind, :situation,:created_at, :updated_at, :user, :fulfillments 
  belongs_to :user
  has_many :fulfillments
  #limit the number of fulfillments to 2
  def fulfillments
    object.fulfillments.limit(5)
  end

  has_many :messages, through: :fulfillments
end
