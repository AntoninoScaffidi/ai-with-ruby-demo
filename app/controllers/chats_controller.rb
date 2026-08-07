class ChatsController < ApplicationController
  def new
  end

  def create
    @message = params[:message]
    chat = RubyLLM.chat
    @response = chat.ask(@message).content
    render :new
  end
end
