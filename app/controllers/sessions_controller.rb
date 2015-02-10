class SessionsController < ApplicationController
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
