class ChatsController < ApplicationController
  def new
    @conversation = current_conversation
  end

  def create
    current_conversation.ask(params[:message])
    redirect_to new_chat_path
  end

  private

  def current_conversation
    Conversation.find_by(id: session[:conversation_id]) || create_conversation
  end

  def create_conversation
    conversation = Conversation.create!
    session[:conversation_id] = conversation.id
    conversation
  end
end
