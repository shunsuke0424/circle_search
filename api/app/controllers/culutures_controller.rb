class CuluturesController < ApplicationController
  def index
    @culuture = Culuture.all
  end
end
