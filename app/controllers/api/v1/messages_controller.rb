class Api::V1::MessagesController < Api::V1::BaseController
    def create
        @message = current_user.messages.create(body: msg_params[:body], room_id: params[:room_id])
    end

    def index
        @message = Message.all
    end
    def show
        @message = Message.all
    end
    
    private
    def msg_params
        params.require(:message).permit(:body)
    end
end
