class ChatsController < ApplicationController
  def new
    @conversation = current_conversation
  end

  def create
    ConversationResponseJob.perform_later(current_conversation.id, params[:message])

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to new_chat_path }
    end
  end

  def destroy
    session.delete(:conversation_id)
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
