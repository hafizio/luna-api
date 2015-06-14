class UsersController < ApplicationController
  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  private

  def set_user
    @user = User.find_by(aim_id: params[:slug])
  end

  def user_params
    params.require(:user).permit(:aim_id)
  end
end
