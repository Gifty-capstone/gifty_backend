class Api::V1::EtsyController < ApplicationController
  before_action :validate_params

  def index
    product = EtsyFacade.product(params[:tag])
    render json: ProductSerializer.new(product)
  end

  private

  def validate_params
    render json: { error: 'Must provide keyword' }, status: :bad_request if params[:tag].blank?
  end
end
