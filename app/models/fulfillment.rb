class Fulfillment < ApplicationRecord
  belongs_to :request
  belongs_to :user 
  has_many :messages, dependent: :destroy

  validates :user , uniqueness: {scope: :request}

end
