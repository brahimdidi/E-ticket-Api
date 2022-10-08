class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'User was created' }
    else
      render json: { message: ' user could not be created , try again !' }, status: :unauthorized
    end
  end

  def destroy
    @user = User.find(params[:id])
    User.destroy_by(id: params[:id])
    if @user.destroy
      render json: { message: "User #{@user.username}  was deleted" }, status: :ok
    else
      render json: { message: 'User could not be deleted' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
