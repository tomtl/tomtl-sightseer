class SessionsController < ApplicationController
  def new
    redirect_to home_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.full_name}! You are signed in."
      redirect_to home_path
    else
      flash[:danger] = "Incorrect email or password."
      redirect_to sign_in_path
    end
  end

end