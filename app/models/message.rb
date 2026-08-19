class Message < ApplicationRecord
  acts_as_message chat: :conversation

  broadcasts_to ->(message) { "conversation_#{message.conversation_id}" }, inserts_by: :append

  def broadcast_append_chunk(content)
    broadcast_append_to "conversation_#{conversation_id}",
      target: "message_#{id}_content",
      content: ERB::Util.html_escape(content.to_s)
  end
end
