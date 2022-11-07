class Api::V1::TweetsController < Api::V1::BaseController

    def index 
        @tweets = Tweet.all
        render json: @tweets
    end
    def show
        @tweet = Tweet.find(params[:id])
        render json: @tweet
    end
    def create
        @tweet = current_user.tweets.create(body: tweet_params[:body], room_id: params[:room_id])
        if @tweet.save
            render json: @tweet
        else
            render json: { error: @tweet.errors.full_messages.to_sentence }, status: 422
        end
    end

    private
    def tweet_params
        params.require(:tweet).permit(:body)
    end
end