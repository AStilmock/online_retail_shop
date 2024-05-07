class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  def index
    #landing page controller
  end

  def new
  end

  def create
    @user = User.new(email: params[:email], crypted_password: params[:password], salt: params[:salt], permission: params[:permission], discount: params[:discount])
    require 'pry'; binding.pry
    if @user.save
      # Create user from email and password entered in form
      # If user is created, create new session with user as session
      # Create new User object setting defaults for permission and discount
      # Password is encrypted at login using password, salt and bcrypt to get crypted_password
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