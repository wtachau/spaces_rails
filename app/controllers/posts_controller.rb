class PostsController < ApplicationController
  
  def create
  	params.permit!
  	@post = Post.create params[:post]
  	render @post
  end
  
end
