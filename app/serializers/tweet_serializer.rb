class TweetSerializer < ActiveModel::Serializer
    attributes :id, :body, :user_id, :room_id, :created_at, :updated_at
    belongs_to :user
    belongs_to :room
  end
  