class Request < ApplicationRecord
  Limit = 5

  belongs_to :user
  has_many :fulfillments , dependent: :destroy

  #enums 
  enum kind: { onetime: 'One Time Help', financial: 'Financial Aid'}
  enum situation: {pending: 'Pending',archived:'archived', fulfilled: 'Fulfilled'}

  #update situation to fulfilled if there is a fulfillment

  def situation
    if updated_at < 1.minutes.ago 
      update(situation: 'archived')
      self.situation = 'archived'
    elsif fulfillments.count >= Limit
      update(situation: 'Fulfilled')
      self.situation = 'Fulfilled'
    else 
      self.situation = 'Pending'
    end
  end

  # if situation updated < 1 minutes ago, then situation is archived and if 
  # fulfillments.count >= Limit, then situation is fulfilled and if not, then situation is pending if updated again then situation is archived






  #scopes
  # scope :pending, -> { where(situation: 'pending') }
  # scope :fulfilled, -> { where(situation: 'fulfilled') }
  # scope :archived, -> { where(situation: 'archived') }
  # scope :onetime, -> { where(kind: 'onetime') }
  # scope :financial, -> { where(kind: 'financial') }
  # scope :recent, -> { order(created_at: :desc) }

  #validations
  validates :description, presence: true
  validates :address, presence: true


  # situation pending to fulfilled when it has 5 fulfillments and created at is less than 2 minutes , if updated at is less than 2 minutes it will be pending again
  # def situation
  #   if  updated_at < 1.minutes.ago 
  #     self.situation = 'archived'
  #   elsif situation == 'Fulfilled'
  #     self.situation = 'Fulfilled'
  #   else
  #     self.situation = 'Pending'
  #   end
  # end

  #update situation 
  # def update_situation
  #   if fulfillments.count >= Limit 
  #     self.situation = 'Fulfilled'
  #   elsif fulfillments.count < Limit && created_at < 2.minutes.ago
  #     self.situation = 'Pending'
  #   else
  #     self.situation = 'archived'
  #   end
  # end


  # def situation
  #   if (self.created_at < 2.minutes.ago || self.fulfillments.count >= Limit) 
  #     self.situation = 'Fulfilled'
  #   else
  #     self.situation = 'Pending'
  #   end
  # end
  


  # def situation_update
  #   if ( Time.now - created_at < 30.seconds)
  #     self.situation = 'Fulfilled'
  #   else
  #     self.situation = 'Pending'
  #   end
  # end
 
  #validations 
  validates :description ,presence: true,length: {maximum: 300},on: :create, allow_nil: false
  

  geocoded_by :address  # can also be an IP address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :reverse_geocode, if: :will_save_change_to_latitude? || :will_save_change_to_longitude?

end
