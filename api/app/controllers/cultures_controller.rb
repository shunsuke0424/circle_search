class CulturesController < ApplicationController
  def index
    @culture = Culture.all
  end
end
