class Request < ApplicationRecord
  belongs_to :user
  has_many :fulfillments , dependent: :destroy
  has_many :messages, through: :fulfillments
  #enums 
  enum kind: { onetime: 'One Time Help', financial: 'Financial Aid'}

  #validations 
  validates :description ,presence: true,length: {maximum: 300},on: :create, allow_nil: false

  #User can only create 2 requests per day
  #validate :user_quota, :on => :create  

  #limit the number of fulfillments per request to 5
  validate :fulfillment_quota, :on => :create
  

  enum situation: {pending: 'Pending', fulfilled: 'Fulfilled'}

  geocoded_by :address  # can also be an IP address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :reverse_geocode, if: :will_save_change_to_latitude? || :will_save_change_to_longitude?


  private 
  # def user_quota
  #  if user.requests.today.count >= 2
  #    errors.add(:base, "Exceeds daily limit")
  #  elsif user.requests.this_week.count >= 5
  #    errors.add(:base, "Exceeds weekly limit")
  #  end
  # end

  def fulfillment_quota
    if fulfillments.count >= 1
      errors.add(:base, "Exceeds daily limit")
    end
  end

end
