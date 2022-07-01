class CulturesController < ApplicationController
  def index
    @cultures = Culture.all
    render json: { cultures: @cultures }, status: 200
  end
end
