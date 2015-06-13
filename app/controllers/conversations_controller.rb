class ConversationsController < ApplicationController
  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
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

  def conversation_params
    params.require(:conversation).permit(:user_id)
  end
end
