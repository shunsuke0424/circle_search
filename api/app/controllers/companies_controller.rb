class CompaniesController < ApplicationController
  def index
    scope = Company.all
    filter_params = params.slice(:company_category, :athletic_id, :culture_id, :art_id, :keyword)
    scope = scope.scope_by_user(filter_params).order(updated_at: :desc)
    @items_total = scope.count
    @companies = scope
    render json: { companies: @companies }, status: 200
  end

  def show
    @company = Company.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'ページが見つかりません' }, status: 404
  end
end
