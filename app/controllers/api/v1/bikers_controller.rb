class Api::V1::BikersController < Api::V1::BaseController

    def index 
        @bikers = Biker.all
        render json: @bikers
    end


end
