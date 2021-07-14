class Api::V1::FriendsController < ApplicationController
  def index
    @friends = Friend.all
    render json: @friends
  end

  def show
    @friend = Friend.find(params[:id])
    render json: @friend
  end
end
