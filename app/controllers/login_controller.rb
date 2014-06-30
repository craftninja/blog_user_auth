class LoginController < ApplicationController
  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    if user = User.find_by(:email => params[:user][:email]).try(:authenticate, params[:user][:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    else
      @user = User.new
      flash.now[:error] = 'Email / password is invalid'
      render :new
    end
  end

end
