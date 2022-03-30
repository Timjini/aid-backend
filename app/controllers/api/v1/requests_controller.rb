class Api::V1::RequestsController < Api::V1::BaseController
  #before_action :set_request, only: [:show, :update, :destroy]
  #before_action :load_request, only: [:show, :index, :delete]

  # GET /requests
  def index
    @request = Request.all
    requests = current_user.requests
    render json: requests
  end

  # GET /requests/1
  def show
    render json: @request
  end

  # POST /requests
  def create
    @request = Request.new(request_params.merge(user: current_user))
    if @request.save
      render json: { request: @request, notice: " has been added to your Requests!" }
    else
      render json: { error: @request.errors.full_messages.to_sentence }, status: 422
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

  end
  def bulk_delete
    requests = Request.where(id: params[:ids], user: current_user)
    if requests.empty?
      render json: { error: "No users found with those IDs" }, status: 422
    else
      requests_count = requests.size
      requests.destroy_all
      render json: { notice: "#{requests_count} requests has been added deleted." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.permit(:description, :address, :longitude, :latitude, :user_id, :fulfillment, :kind, :username)
    end
    
    def load_request
      @request = Request.all
    end
end
