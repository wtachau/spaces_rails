class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :verify_logged_in

	def verify_logged_in
		if !logged_in?
			redirect_to '/login'
		else
			@current_user = current_user.decorate
		end
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

	# Logs in user
	def log_in(user)
		session[:user_id] = user.id
	end

	# Logs out the current user.
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	protected
		# Lookup current user by session cookie
		def current_user
			User.find_by(id: session[:user_id])
		end
end
