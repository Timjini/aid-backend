class Api::V1::RoomsController < Api::V1::BaseController
  before_action :authenticate_user!
  def index
    @room = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)
    render json: @rooms
  end

  def show
    @single_room = Room.find(params[:id])
   
    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)

    render json: @single_room
  end
  
  def create
    @room =  Room.create(name: params["room"]["name"])
  end



end
