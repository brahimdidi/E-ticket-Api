class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def register
    if User.find_by(username: params[:username].to_s.downcase)
      render json: { error: 'Username already exists! please choose another one.' }
    else
      @user = User.new(user_params)
      @user.username = @user.username.to_s.downcase
      if @user.save
        render json: { user: @user, logged_in: true }
      else
        render json: { error: 'There was an error, please try again!' }
      end
    end
  end

  def login
    @user = User.find_by(username: params[:username].to_s.downcase)
    if @user
      render json: { user: @user, logged_in: true }
    else
      render json: { error: 'Username is invalid' }
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

  def user_event
    @events = User.find(params[:id]).events
    render json: { events: @events }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
