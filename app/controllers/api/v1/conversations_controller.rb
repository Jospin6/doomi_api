class Api::V1::ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[ show update destroy ]

  # GET /conversations
  def index
    @conversations = Conversation.all

    render json: @conversations
  end

  # GET /conversations/1
  def show
    render json: @conversation
  end

  def user_conversations
    conversations = Conversation
      .joins("LEFT JOIN users AS user1 ON user1.id = conversations.user1_id")
      .joins("LEFT JOIN users AS user2 ON user2.id = conversations.user2_id")
      .where("conversations.user1_id = ? OR conversations.user2_id = ?", current_user.id, current_user.id)
      .select("conversations.*, 
               CASE 
                 WHEN conversations.user1_id = ? THEN user2.name 
                 ELSE user1.name 
               END AS other_user_name",
               current_user.id)
      .order("conversations.updated_at DESC")
  
    conversations_with_last_message = conversations.map do |conversation|
      last_message = conversation.messages.order("created_at DESC").first
      {
        conversation: conversation,
        other_user_name: conversation.other_user_name,
        last_message: last_message
      }
    end
  
    render json: conversations_with_last_message
  end
  

  # POST /conversations
  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      render json: @conversation, status: :created
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversations/1
  def update
    if @conversation.update(conversation_params)
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversations/1
  def destroy
    @conversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.require(:conversation).permit(:user1_id, :user2_id)
    end
end
