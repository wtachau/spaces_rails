class PostsController < ApplicationController
  def create

  	puts params[:post]

  	params.permit!
  	@post = Post.create params[:post]
  	puts @post.id
  	render @post

  end
end
