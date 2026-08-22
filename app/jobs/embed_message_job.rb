class EmbedMessageJob < ApplicationJob
  def perform(message_id)
    message = Message.find_by(id: message_id)
    return unless message

    result = RubyLLM.embed(message.content)
    message.update!(embedding: result.vectors)
  end
end
