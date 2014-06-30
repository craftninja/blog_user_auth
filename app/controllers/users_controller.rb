class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_parameters)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def allowed_parameters
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
