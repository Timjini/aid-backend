class Api::V1::ContestsController < Api::V1::BaseController
    #skip authentication for index and show
    skip_before_action :authenticate_user_using_x_auth_token ,  only: [:index, :show, :create]
    #skip authenticate_user! for index and show
    skip_before_action :authenticate_user!,  only: [:index, :show, :create]

    def index 
        @contests = Contest.all
        render json: @contests
    end

    def create
        @contest = Contest.new(contest_params)
        if @contest.save
            render json: @contest
        else
            render json: @contest.errors
        end
    end

    private 

    def contest_params
        params.require(:contest).permit(:first_name, :last_name, :email, :slogan)
    end
end