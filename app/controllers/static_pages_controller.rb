class StaticPagesController < ApplicationController
  def index
    @client = Pexels::Client.new(ENV["Pexels"])
    @images = []
    if params[:collection_id]
      begin
        @images = @client.collections[params[:collection_id]].media
      rescue
        @images = []
      end
    end
  end
end
