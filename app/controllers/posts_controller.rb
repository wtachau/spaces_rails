class PostsController < ApplicationController
  
  def create
  	params.permit!
  	@post = current_user.posts.create params[:post]
  	render @post
  end
  
end
