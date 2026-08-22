class AddEmbeddingToMessages < ActiveRecord::Migration[8.1]
  def change
    # 1536 dimensions matches OpenAI's text-embedding-3-small, RubyLLM's default.
    add_column :messages, :embedding, :vector, limit: 1536
    add_index :messages, :embedding, using: :hnsw, opclass: :vector_cosine_ops
  end
end
