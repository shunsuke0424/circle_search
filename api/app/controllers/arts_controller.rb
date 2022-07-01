class ArtsController < ApplicationController
  def index
    @arts = Art.all
    render json: { arts: @arts }, status: 200
  end
end
