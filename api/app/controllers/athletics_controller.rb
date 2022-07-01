class AthleticsController < ApplicationController
  def index
    @athletics = Athletic.all
    render json: { athletics: @athletics }, status: 200
  end
end
