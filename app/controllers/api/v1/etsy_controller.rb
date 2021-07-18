class Api::V1::EtsyController < ApplicationController
  before_action :validate_params

  def index
    product = EtsyFacade.product(params[:tag])
    render json: ProductSerializer.new(product)
  end

  private

  def validate_params
    if params[:tag].blank?
      render json: { error: "Must provide keyword" }, status: :bad_request
    end
  end
end
