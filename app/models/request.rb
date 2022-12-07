class Request < ApplicationRecord
  Limit = 5

  belongs_to :user
  has_many :fulfillments , dependent: :destroy
  


  #enums 
  enum kind: { onetime: 'One Time Help', financial: 'Financial Aid'}
  enum situation: {pending: 'Pending',archived:'archived', fulfilled: 'Fulfilled'}

  #update situation to fulfilled if there is a fulfillment

  def situation
    if updated_at < 24.hours.ago 
      update(situation: 'archived')
      self.situation = 'archived'
    elsif fulfillments.count >= Limit
      update(situation: 'Fulfilled')
      self.situation = 'Fulfilled'
    else 
      self.situation = 'Pending'
    end
  end

  #validations
  validates :description, presence: true
  validates :address, presence: true
  validates :description ,presence: true,length: {maximum: 300},on: :create, allow_nil: false
  

  geocoded_by :address  # can also be an IP address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :reverse_geocode, if: :will_save_change_to_latitude? || :will_save_change_to_longitude?

end
