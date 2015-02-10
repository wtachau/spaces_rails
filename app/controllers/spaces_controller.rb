class SpacesController < ApplicationController
  
  def home
  	if !logged_in?
  		redirect_to '/login'
  	end
  	# To create a form
  	@post = Post.new
  	@posts = Post.order('updated_at DESC').all
  	@current_user = current_user
  end

end
