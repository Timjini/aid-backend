class Request < ApplicationRecord


  belongs_to :user
  has_many :fulfillments
  #enums 
  enum kind: { onetime: 'One Time Help', financial: 'Financial Aid'}

  #validations 
  validates :description ,presence: true,length: {maximum: 300},on: :create, allow_nil: false

  #User can only create 2 requests per day
  #validate :user_quota, :on => :create  

  enum situation: {pending: 'Pending', fulfilled: 'Fulfilled'}

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # has_many :comments

  private 
  # def user_quota
  #  if user.requests.today.count >= 2
  #    errors.add(:base, "Exceeds daily limit")
  #  elsif user.requests.this_week.count >= 5
  #    errors.add(:base, "Exceeds weekly limit")
  #  end
  # end

end
