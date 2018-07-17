class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      response.set_header('role', 'user');
      render json: session
    else
      render json: {"error": 402, "message": "Bad authentication"}
    end
  end

  def destroy
  end
end