class UserMailer < ApplicationMailer
	def welcome_email
    @user = params[:user]
    @url  = 'localhost/login'
    mail(to: @user.email, subject: 'Welcome to myRh')
  end
end
