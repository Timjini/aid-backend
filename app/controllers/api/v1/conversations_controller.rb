# class Api::V1::ConversationsController < Api::V1::BaseController

#     def index 
#         @conversations = current_user.mailbox.conversations
#          #render json: @conversation

#     end
    
#     def show
#         @conversations = current_user.mailbox.conversations.find(params[:id])
#         render json: @conversations
#     end

#     def create
#         recipient = User.find(params[:user_id])
#         receipt = current_user.send_message(recipient, params[:body], params[:subject])
#         redirect_to conversation_path(receipt.conversation)
#     end

#     def new
#         @recipients = User.all - [current_user]

#     end



# end

