class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      user.generate_token()
      user.save
      response.set_header('role', 'user');
      render json: user
    else
      render json: {"error": 402, "message": "Bad authentication"}
    end
  end

  def destroy
    @current_user.token = nil
    @current_user.save
  end
end