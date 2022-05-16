class Ask < ApplicationRecord

  enum kind: {
      One_time: 0,
      Financial:1
  }
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
