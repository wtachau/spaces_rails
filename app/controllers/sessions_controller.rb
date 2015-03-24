class SessionsController < ApplicationController

	skip_before_filter :verify_logged_in

	def new
		if logged_in?
			redirect_to root_url
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end

end
