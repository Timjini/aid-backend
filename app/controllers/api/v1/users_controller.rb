# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:create, :show, :index]
  skip_before_action :authenticate_user_using_x_auth_token, only: [:create, :show, :index, :destroy]

  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  
  end

  def show 
    @user = User.all
    render json: @users
  end

  def create
    user = User.create user_params
    
    if user.valid?
      sign_in(user)
      render json: { user: user, auth_token: user.authentication_token }
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 422
    end
  end

  def update
    if @user.blank?
      respond_with_error "User with id #{params[:id]} not found.", :not_found

    elsif @user.update(user_params)
      render json: @user

    else
      render json: { error: @user.errors.full_messages.to_sentence }, status: 422
    end
  end

  def destroy
    if @user.blank?
      respond_with_error "User with id #{params[:id]} not found.", :not_found

    elsif @user.destroy
      render json: @user

    else
      render json: { error: @user.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

  private
  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

    def set_user
      @user = User.find_by_id(params[:id])  
    end

    def user_params
      params.require(:user).permit(:id,:email, :first_name, :last_name, :password, :password_confirmation, :username,:file)
    end
end
