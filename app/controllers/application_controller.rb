class ApplicationController < ActionController::API
    protect_from_forgery with: :null_session

    before_action :authenticate
    attr_accessor :current_user

    def logged_in?
      set_current_user
      !!@current_user
    end

    def current_user
      @current_user
    end

    def set_current_user
      if has_valid_auth_type?
        user = User.find_by(auth_token: auth_secret[:auth_token])
        if user
          @current_user = user
        end
      end
    end

    def authenticate
      unless logged_in?
        render json: {
            success: false,
            error: 'Invalid credentials'
        }, status: :unauthorized
      end
    end

    private

      def auth_header
        request.headers['Authorization'].to_s.scan(/Bearer (.*)$/).flatten.last
      end

      def has_valid_auth_type?
        !!request.headers['Authorization'].to_s.scan(/Bearer/).flatten.first
      end

      def auth_secret
        Auth.decode(auth_header) || {}
      end
  end
end
