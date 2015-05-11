class PostsController < ApplicationController
  
	def create
		project = Project.find params.require(:post).permit(:project)[:project]
		@post = project.posts.create post_params
		render @post.decorate
		Thread.new do
			NotificationMailer.followed_project_post(@post).deliver_now
		end
	end
  
	def new
		@new_post = Post.new
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

	private
		def post_params
			params.require(:post).permit(:short, :long, :link, tag_list:[])
		end

end
