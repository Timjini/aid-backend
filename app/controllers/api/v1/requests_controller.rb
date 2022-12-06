class Api::V1::RequestsController < Api::V1::BaseController
  before_action :authenticate_user!, except: [:create, :index, :show]
  skip_before_action :authenticate_user_using_x_auth_token, only: [:show, :index]

  # GET /requests
  def index
    @requests = Request.all
    render json: @requests
  end

  # GET /requests/1
  def show 
    @request = Request.find(params[:id])
    render json: @request 
  end

  # POST /requests
  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      render json: @request, status: :created
    else
      render json: { error: @request.errors.full_messages.to_sentence }, status: 422
    end
  end

  # PATCH/PUT /requests/1
  def update
      @user = current_user
      @request = Request.find(params[:id])
      if @request.update(request_params)
        render json: @request
      else
        render json: { error: @request.errors.full_messages.to_sentence }, status: 422
      end
  end

  # DELETE /requests/1
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:description, :address, :longitude, :latitude,:fulfillment, :kind, :situation, :user_id, :fulfillment_id)
    end
end
