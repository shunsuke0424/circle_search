class ArtsController < ApplicationController
  def index
    @art = Art.all
  end
end
