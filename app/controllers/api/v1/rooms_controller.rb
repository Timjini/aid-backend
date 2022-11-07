class Api::V1::RoomsController < Api::V1::BaseController
  before_action :authenticate_user!
  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @tweet = Tweet.all

    @users = User.all_except(current_user)
    render json: @users
  end

  def show
    @single_room = Room.find(params[:id])
   
    @room = Room.new
    @rooms = Room.public_rooms

    @tweet = Tweet.new
    @tweets = @single_room.tweets.order(created_at: :asc)

    @users = User.all_except(current_user)
    render json: @tweets
  end
  
  def create
    @room =  Room.create(name: params["room"]["name"])
    @room.users = @current_user

    render json: @room
  end



end
