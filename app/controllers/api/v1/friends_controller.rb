class Api::V1::FriendsController < ApplicationController
  before_action :set_user
  before_action :set_friend, only: %i[show destroy]
  def index
    Rails.cache.fetch(@user.to_s, expires_in: 30.seconds) do
      render json: UserSerializer.new(@user, include: [:friends])
    end
  end

  def show
    Rails.cache.fetch(@friend.to_s, expires_in: 30.seconds) do
      render json: FriendSerializer.new(@friend, include: [:gifts])
    end
  end

  def create
    friend = Friend.new(friend_params)
    if friend.save
      render json: FriendSerializer.new(friend), status: :created
    else
      render json: { errors: friend.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @friend.destroy
  end

  private

  def friend_params
    params.permit(:name, :memo, :user_id, :birthday)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_friend
    @friend = Friend.find(params[:id])
  end
end
