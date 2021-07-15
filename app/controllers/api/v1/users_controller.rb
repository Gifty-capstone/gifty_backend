class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: %i[ destroy]

  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user)
    else
      render json: user.errors, status: :bad_request
    end
  end

  def destroy
    User.destroy(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday)
  end
end
