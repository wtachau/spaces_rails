class PostsController < ApplicationController
  
	def create
		@post = current_user.posts.create post_params
		render @post
	end

	def relevant
		render get_relevant_posts
	end

	def update_form
		render partial:'form'
	end

	def show
		render partial:'full_post', locals:{ post: (Post.find params[:id]) }
	end

	def follow 
		params.permit :id
		post_id = params[:id]

		if follow = Follow.where(post_id: post_id, user_id:current_user.id).first
			Follow.delete follow
			result = 'follow'
		else 
			current_user.follows.create post_id: post_id
			result = 'following'
		end
		num_follows = get_follow_text((Post.find post_id).follows)
		render json: { result: result, post: post_id, num_follows: num_follows }
	end

	private
		def post_params
			params.require(:post).permit(:short, :long, :tag_list)
		end

end
