class CompaniesController < ApplicationController
  def index
    scope = Company.all
    @items_total = scope.count
    @companies = scope
    render json: { companies: @companies }, status: 200
  end

  def show
    @company = Company.find(params[:id])
    render json: { company: @company }, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'ページが見つかりません' }, status: 404
  end
end
