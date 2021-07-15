class Api::V1::FriendsController < ApplicationController
  before_action :set_user
  before_action :set_friend, only: [:show]
  def index
    render json: UserSerializer.new(@user, include: [:friends])
  end

  def show
    render json: FriendSerializer.new(@friend, include: [:gifts])
  end

  def create
    friend = Friend.new(friend_params)
    if friend.save
      render json: FriendSerializer.new(friend), status: :created
    else
      render json: { errors: friend.errors.full_messages }, status: :bad_request
    end
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
