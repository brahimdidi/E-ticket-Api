class  Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: { user: @users }
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    if User.find_by_email(user_params[:email])
      render json: { error: 'Email exits, try a diffrent one' }, status: :not_acceptable
    else
      @user = User.create(user_params)

      if @user.valid?
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, token: }, status: :ok
      else
        render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
      end
    end
  end

  def login
    @user = User.find_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password_digest])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
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
    params.require(:user).permit(:username, :email, :password_digest)
  end
end