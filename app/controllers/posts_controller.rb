class PostsController < ApplicationController
  
	def create
		@post = current_user.posts.create post_params
		render @post
	end

	def relevant
		render PostsService.new(current_user).get_relevant_posts
	end

	def update_form
		render partial:'form'
	end

	def show
		@current_user = current_user
		render partial:'full_post', locals:{ post: (Post.find params[:id]).decorate }
	end

	def follow 
		params.permit :id
		post_id = params[:id]
		
		result = FollowService.new(post_id, current_user).follow_clicked
		num_follows = (Post.find post_id).decorate.descriptive_follow_text

		render json: { result: result, post: post_id, num_follows: num_follows }
	end

	private
		def post_params
			params.require(:post).permit(:short, :long, :tag_list)
		end

end
