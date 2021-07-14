class Api::V1::Users::FriendsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: UserSerializer.new(user, include: [:friends])
  end
end
