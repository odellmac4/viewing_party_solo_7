class WelcomeController < ApplicationController
  def index
    @users = User.all

    # if session[:user_id].nil?
    #   flash[:notice] = "You must be logged in or registered to access a user's dashboard."
    #   redirect_to root_path
    # end
  end
end
