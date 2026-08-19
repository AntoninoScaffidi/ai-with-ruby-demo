class ConversationResponseJob < ApplicationJob
  def perform(conversation_id, content)
    conversation = Conversation.find(conversation_id)
    assistant_message = nil

    conversation.ask(content) do |chunk|
      next if chunk.content.blank?

      assistant_message ||= conversation.messages.last
      assistant_message.broadcast_append_chunk(chunk.content)
    end
  end
end
