class Fulfillment < ApplicationRecord
  belongs_to :request
  belongs_to :user 
  has_many :messages, dependent: :destroy

end
