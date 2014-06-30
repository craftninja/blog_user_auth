class WelcomeController < ApplicationController
  def index
    @user = User.last
  end
end
