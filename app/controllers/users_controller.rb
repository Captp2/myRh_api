  class UsersController < ApplicationController
    def new
    end

    private def user_params
     params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
   end

   private def token_params
    params.require(:activation_token)
  end

  def validate
    user = User.find_by activation_token: token_params
    user.role = 1
    user.save

    render json: user
  end

  def create
    user = User.create(user_params)
    user.activation_token = SecureRandom.hex(36)
    user.save

    if user.validate
      UserMailer.with(user: user).welcome_email.deliver_now
      render json: user
    else
      render json: user.errors
    end
  end

  def index
    if logged_in?
      render json:  User.all
    else
      render json: ["error": "You need to be authenticated"]
    end
  end
end
