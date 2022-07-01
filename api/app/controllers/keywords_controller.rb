class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.all
    render json: { keywords: @keywords }, status: 200
  end
end
