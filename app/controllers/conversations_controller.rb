class ConversationsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.update(user_id: @user.id)
      render json: @conversation, status: 201
    else
      render json: { errors: @conversation.errors }, status: 422
    end
  end

  def index
    @conversations = Conversation.all
    render json: @conversations, serializer: ConversationsController
  end

  private

  def set_user
    @user = User.find_by(aim_id: params[:conversation][:aim_id])
  end

  def conversation_params
    params.require(:conversation).permit(:user_id, :aim_id)
  end
end
