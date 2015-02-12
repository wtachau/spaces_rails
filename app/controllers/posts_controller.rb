class PostsController < ApplicationController
  
  def create
  	params.permit!
  	@post = current_user.posts.create params[:post]
  	render @post
  end
  
  def relevant
  	render get_relevant_posts
  end

  def update_form
  	render partial:'form'
  end

  def show
  	puts params
  	render partial:'full_post', locals:{ post: Post.find_by(id: params[:id])}
  end
end
