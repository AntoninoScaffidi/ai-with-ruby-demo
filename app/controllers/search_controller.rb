class SearchController < ApplicationController
  def show
    @query = params[:q].to_s.strip
    return if @query.blank?

    query_embedding = RubyLLM.embed(@query).vectors
    @results = Message.where.not(embedding: nil)
                       .nearest_neighbors(:embedding, query_embedding, distance: "cosine")
                       .first(10)
  end
end
