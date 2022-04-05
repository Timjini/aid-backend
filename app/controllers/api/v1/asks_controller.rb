class Api::V1::AsksController < Api::V1::BaseController
  #before_action :set_request, only: [:show, :update, :destroy]
  #before_action :load_request, only: [:show, :index, :delete]

  # GET /requests
  def index
    @ask = Ask.all
    asks = current_user.asks
    render json: asks
  end

  # GET /requests/1
  def show
    @ask = current_user.asks
    render json: @ask
  end

  # POST /requests
  def create
    @ask = Ask.new(ask_params.merge(user: current_user))
    if @ask.save
      render json: { ask: @ask, notice: " has been added to your Requests!" }
    else
      render json: { error: @ask.errors.full_messages.to_sentence }, status: 422
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @ask.update(ask_params)
      render json: @ask
    else
      render json: @ask.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @ask = Ask.find(params[:id])
    @ask.destroy

  end
  # def bulk_delete
  #   demands = Request.where(id: params[:ids], user: current_user)
  #   if demands.empty?
  #     render json: { error: "No users found with those IDs" }, status: 422
  #   else
  #     demands_count = demands.size
  #     demands.destroy_all
  #     render json: { notice: "#{demands_count} requests has been added deleted." }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asks
      @asks = Ask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ask_params
      params.permit(:description, :address, :longitude, :latitude, :fulfillment, :kind)
    end
    
    def load_demand
      @ask = Ask.all
    end
end
