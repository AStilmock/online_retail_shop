class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  def index
    @user = User.last
    @current_user = current_user
  end

  def new
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      auto_login(@user)
      redirect_to(root_path, notice: 'User created')
    else
      render action: 'new'
      flash.now[:alert] = 'Login failed - Please try again'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end