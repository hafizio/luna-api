class UsersController < ApplicationController
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
    render json: @users, serializer: UsersController
  end

  private

  def user_params
    params.require(:user).permit(:aim_id)
  end
end
