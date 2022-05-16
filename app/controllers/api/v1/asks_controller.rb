class Api::V1::AsksController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:show, :create, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /requests
  def index
    @ask = Ask.all.order(created_at: :asc)
    # asks = current_user.asks
    render json: @ask
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
    @ask.destroy

  end

  def correct_user
    @ask = current_user.asks.find_by(id: params[:id])
    redirect_to asks_path , notice: "Not Authorized to edit" if @ask.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asks
      @asks = Ask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ask_params
      params.permit(:description, :address, :longitude, :latitude, :fulfillment, :kind, :user_id)
    end
    
    def load_demand
      @ask = Ask.all
    end

end
