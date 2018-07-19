  class UsersController < ApplicationController
    def new
    end

    private def user_params
     params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
   end

   def create
    user = User.create(user_params)
    
    if user.validate
      render json: user
    else
      render json: user.errors
    end
  end

  def index
    if logged_in?
      render json:  User.all
    else
      render json: request.headers[:ID]
    end
  end
end