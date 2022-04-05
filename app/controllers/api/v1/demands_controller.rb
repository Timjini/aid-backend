class Api::V1::DemandsController < Api::V1::BaseController
  #before_action :set_request, only: [:show, :update, :destroy]
  #before_action :load_request, only: [:show, :index, :delete]

  # GET /requests
  def index
    @demand = Demand.all
    demands = current_user.demands
    render json: demands
  end

  # GET /requests/1
  def show
    @demand = current_user.demands
    render json: @demand
  end

  # POST /requests
  def create
    @demand = Demand.new(demand_params.merge(user: current_user))
    if @demand.save
      render json: { demand: @demand, notice: " has been added to your Requests!" }
    else
      render json: { error: @demand.errors.full_messages.to_sentence }, status: 422
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @demand.update(demand_params)
      render json: @demand
    else
      render json: @demand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @demand = Demand.find(params[:id])
    @demand.destroy

  end
  def bulk_delete
    demands = Request.where(id: params[:ids], user: current_user)
    if demands.empty?
      render json: { error: "No users found with those IDs" }, status: 422
    else
      demands_count = demands.size
      demands.destroy_all
      render json: { notice: "#{demands_count} requests has been added deleted." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demands
      @demands = Demand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def demand_params
      params.permit(:description, :address, :longitude, :latitude, :user_id, :fulfillment, :kind, :username)
    end
    
    def load_demand
      @demand = Demand.all
    end
end
