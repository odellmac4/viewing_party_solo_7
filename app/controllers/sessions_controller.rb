class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: email)
    
    if user.authenticate(password)
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      session[:location] = params[:location]
      redirect_to user_path(user)
      # if user.admin?
      #   redirect_to admin_dashboard_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def email
    params[:email]
  end

  def password
    params[:password]
  end
end