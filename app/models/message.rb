class Message < ApplicationRecord
    belongs_to :user
    belongs_to :fulfillment
    #validates :body, presence: true, length: { maximum: 300 }
    #belongs_to :request
    has_many :messages, through: :fulfillments
end
