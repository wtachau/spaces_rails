class PostsController < ApplicationController
  
	def new
		render partial:'form'
	end

	def relevant
		@current_user = current_user
		render PostsService.new(current_user).relevant_posts_decorated
	end

	def show
		@post = (Post.find params.permit(:id)[:id]).decorate
		render 'full_page'
	end

	def preview
		render partial:'full_post', locals:{ post: (Post.find params[:id]).decorate, full: false }
	end

	def follow 
		params.permit :id
		post_id = params[:id]
		result = FollowService.new(post_id, current_user).follow_clicked
		num_follows = (Post.find post_id).decorate.descriptive_follow_text

		render json: { result: result, post: post_id, num_follows: num_follows }
	end

	def tagged
		render partial: "popup", locals: { posts: PostDecorator.decorate_collection(Post.has_tag(params[:tag])), tag: params[:tag] }
	end

	private
		def post_params
			params.require(:post).permit(:short, :long, :link, tag_list:[])
		end

end
