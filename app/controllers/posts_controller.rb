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
  	render partial:'full_post', locals:{ post: Post.find_by(id: params[:id])}
  end

  def follow 
    params.permit!
    post_id = params[:id]
    result = 'following'
    if follow = Follow.where(post_id: post_id, user_id:current_user.id).first
      Follow.delete follow
      result = 'follow'
    else 
      current_user.follows.create post_id: post_id
    end
    num_follows = get_follow_text(Post.find_by(id: post_id).follows)
    render json: { result: result, post: post_id, num_follows: num_follows }
  end
end
