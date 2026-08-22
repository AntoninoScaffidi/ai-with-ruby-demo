class Message < ApplicationRecord
  acts_as_message chat: :conversation
  has_neighbors :embedding

  broadcasts_to ->(message) { "conversation_#{message.conversation_id}" }, inserts_by: :append

  after_commit :enqueue_embedding, on: %i[create update], if: -> { content.present? && saved_change_to_content? }

  def broadcast_append_chunk(content)
    broadcast_append_to "conversation_#{conversation_id}",
      target: "message_#{id}_content",
      content: ERB::Util.html_escape(content.to_s)
  end

  private

  def enqueue_embedding
    EmbedMessageJob.perform_later(id)
  end
end
