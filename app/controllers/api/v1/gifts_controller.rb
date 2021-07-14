class Api::V1::GiftsController < ApplicationController
  def index
    @gifts = Gift.all
    render json: @gifts
  end

  def show
    @gift = Gift.find(params[:id])
    render json: @gift
  end
end
