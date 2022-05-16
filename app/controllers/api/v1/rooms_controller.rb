class Api::V1::RoomsController < Api::V1::BaseController
  before_action :authenticate_user!
  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @message = Message.all

    @users = User.all_except(current_user)
    render json: @users
  end

  def show
    @single_room = Room.find(params[:id])
   
    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)
    render json: @messages
  end
  
  def create
    @room =  Room.create(name: params["room"]["name"])
  end



end
