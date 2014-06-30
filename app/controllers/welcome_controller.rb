class WelcomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:current_user_id])
  end
end
