class Fulfillment < ApplicationRecord
  LIMIT = 5

  belongs_to :request
  belongs_to :user 

  #limit the number of users that can fulfill a request
  # validate :limit_of_fulfillments, on: :create , if: :request = Fulfillment::LIMIT , message: "You can't fulfill this request"


end
