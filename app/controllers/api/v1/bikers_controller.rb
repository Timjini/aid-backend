class Api::V1::BikersController < Api::V1::BaseController
    #skip authentication for index and show
    skip_before_action :authenticate_user_using_x_auth_token ,  only: [:index, :show]
    #skip authenticate_user! for index and show
    skip_before_action :authenticate_user!,  only: [:index, :show]

    def index 
        @bikers = Biker.all
        render json: @bikers
    end


end
