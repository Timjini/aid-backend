class Request < ApplicationRecord
  Limit = 5

  belongs_to :user
  has_many :fulfillments , before_add: :validate_quota
  has_many :messages, through: :fulfillments
  #enums 
  enum kind: { onetime: 'One Time Help', financial: 'Financial Aid'}
  enum situation: {pending: 'Pending', fulfilled: 'Fulfilled'}

  #change sitation to fulfilled if fulfillments.size >= Limit
  def situation
    if fulfillments.size >= Limit
      self.situation = 'Fulfilled'
    end
  end
 
 
  #validations 
  validates :description ,presence: true,length: {maximum: 300},on: :create, allow_nil: false
  

  geocoded_by :address  # can also be an IP address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :reverse_geocode, if: :will_save_change_to_latitude? || :will_save_change_to_longitude?


  private 
  def validate_quota
    raise FulfillmentLimitExceeded if fulfillments.size >= Limit
  end

end
