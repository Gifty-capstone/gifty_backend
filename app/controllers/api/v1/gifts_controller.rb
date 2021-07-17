class Api::V1::GiftsController < ApplicationController
  before_action :find_friend
  before_action :find_gift, only: %i[show destroy update]

  def index
    render json: FriendSerializer.new(@friend, include: [:gifts])
  end

  def show
    render json: GiftSerializer.new(@gift)
  end

  def create
    gift = Gift.new(gift_params)
    if gift.save
      render json: GiftSerializer.new(gift), status: :created
    else
      render json: { errors: gift.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @gift.destroy
  end

  def update
    if params[:status] == ("purchased" || "pending")
      @gift.update(gift_params)
      render json: GiftSerializer.new(@gift), status: :created
    else
      render json: { errors: "Invalid status" }, status: :bad_request
    end
  end
  private

  def gift_params
    params.permit(:name, :description, :status, :friend_id)
  end

  def find_friend
    @friend = Friend.find(params[:friend_id])
  end

  def find_gift
    @gift = Gift.find(params[:id])
  end
end
