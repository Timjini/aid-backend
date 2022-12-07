class Api::V1::MessagesController < Api::V1::BaseController
    # before_action :authenticate_user!, except: [:create, :index, :show]
    # skip_before_action :authenticate_user_using_x_auth_token 

    def index
          #index messages to request user and fulfillment user
            @messages = Message.all
            render json: @messages

    end

    #show message with action cable broadcast MessageChannel
    def show
        @message = Message.find(params[:id])
        render json: @message
    end

    def create
        @message = Message.new(message_params)
        @message.user = current_user
        @message.fulfillment = Fulfillment.find(params[:fulfillment_id])
        if @message.save
            render json: @message, status: :created
        else
            render json: { error: @message.errors.full_messages.to_sentence }, status: 422
        end
    end


    private
    def message_params
        params.require(:message).permit(:body, :fulfillment_id, :user_id)
    end

end