class PostsController < ApplicationController
  
  def create
  	params.permit!
  	puts params
  	@post = current_user.posts.create params[:post]
  	@post.save
  	render @post
  end
  
end
