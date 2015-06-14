class MessagesController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    @message = Message.new(message_params)
    if @message.update(user_id: @user.id)
      render json: @message, status: 201
    else
      render json: { errors: @message.errors }, status: 422
    end
  end

  def index
    @messages = Message.all
    render json: @messages
  end

  private

  def set_user
    @user = User.find_by(aim_id: params[:message][:aim_id])
  end

  def message_params
    params.require(:message).permit(:user_id, :aim_id)
  end
end
