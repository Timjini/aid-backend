class Fulfillment < ApplicationRecord
  belongs_to :request
  belongs_to :user 
  has_many :messages, dependent: :destroy
  #user can only fulfill one request at a time
  def can_fulfill?(request)
    fulfillments.where(request: request).empty?
  end

end
