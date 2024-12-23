class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(root_path, notice: 'Login successful') #text not displaying after successful login
    else
      flash.now[:alert] = 'Login failed' #text not displaying after failed login
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end
