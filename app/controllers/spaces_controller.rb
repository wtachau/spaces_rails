class SpacesController < ApplicationController
  
  def home
  	if !logged_in?
  		redirect_to '/login'
  	end
  	@post = Post.new # To create a form
  	@posts = Post.order('updated_at DESC').all
  	@current_user = current_user
  	# @tags = ActsAsTaggableOn::Tag.all
  end

end
