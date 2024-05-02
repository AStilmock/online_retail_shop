class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  def index
    #landing page controller
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to(:users, notice: 'User created')
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