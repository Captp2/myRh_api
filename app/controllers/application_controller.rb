class ApplicationController < ActionController::API
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
	before_action :verify_logged_in

	def verify_logged_in
		# render json: session
		# if !session[:user_id]
		# 	response.set_header('role', 'guest')
		# else
		# 	@current_user ||= User.find(session[:user_id]) if session[:user_id]
		# 	response.set_header('role', 'user')
		# end
	end

	def authorize
		redirect_to '/login' unless current_user
	end
end
