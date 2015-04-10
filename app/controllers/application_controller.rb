class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	
	before_action :current_user
	skip_before_action :current_user, only: [:verify_logged_in, :login, :logged_in]

	before_filter :verify_logged_in

	def verify_logged_in
		if !logged_in?
			redirect_to '/login'
		end
	end

	# Logs in user
	def log_in(user)
		session[:user_id] = user.id
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

	# Logs out the current user.
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	protected
		# Sets current user by lookup of session cookie
		def current_user
			@current_user = User.find_by(id: session[:user_id]).decorate
		end
end
