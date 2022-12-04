class Api::V1::FulfillmentsController < Api::V1::BaseController
    #before_action :authenticate_user!
    #skip_before_action :authenticate_user_using_x_auth_token , only: [:create]
  
    # GET /fulfillments
    # def index
    #   @fulfillments = Fulfillment.all
    #   render json: @fulfillments  
    # end
    def index
      @fulfillments = Fulfillment.all
      render json: @fulfillments, include: [:user, :request] 
    end
  
    # GET /fulfillments/1
    def show
      @fulfillment = Fulfillment.find(params[:id])
      render json: @fulfillment
    end
  
    # POST /fulfillments
    def create
      @fulfillment = current_user.fulfillments.create(fulfillment_params)
      @fulfillment.request_id = fulfillment_params[:request_id]
      if @fulfillment.save
        render json: @fulfillment, status: :created
      else
        render json: @fulfillment.errors, status: :unprocessable_entity, status: 422
      end
    end
  
    # PATCH/PUT /fulfillments/1
    def update
        user = current_user
        @fulfillment = Fulfillment.find(params[:id])
        if @fulfillment.update(fulfillment_params)
          render json: @fulfillments
        else
          render json: { error: @fulfillment.errors.full_messages.to_sentence }, status: 422
        end
    end
  
    # DELETE /fulfillments/1
    def destroy
      @fulfillment = Fulfillment.find(params[:id])
      @fulfillment.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_fulfillment
        @fulfillment = Fulfillment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def fulfillment_params
        params.require(:fulfillment).permit(:request_id, :user_id)
      end 
  end
  