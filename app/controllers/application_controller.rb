class ApplicationController < ActionController::API
	def current_user
		user ||= User.find(request.headers[:ID]) if request.headers[:ID]
		if(user && user.token === request.headers[:token])
			@current_user = user
		end
	end

	def logged_in?
		current_user != nil && current_user.role == 1
	end

	def allow_options
		head(:ok) if request.request_method == "OPTIONS"
	end

	def verify_logged_in
		if logged_in?
			response.set_header('role', 'user')
		else
			response.set_header('role', 'guest')
		end
	end

	helper_method :current_user, :logged_in
	after_action :verify_logged_in, :allow_options

	def authorize
		redirect_to '/login' unless current_user
	end
end
