class PostsController < ApplicationController
    respond_to :json, only: [:show, :relevant, :index, :create]
    
	def create
		project = Project.find params.require(:post).permit(:project)[:project]
		@post = project.posts.create post_params
		respond_with @post
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
		@posts = PostsService.new(current_user).relevant_posts_decorated
		respond_with @posts, template: "posts/index"
	end

	def show
		@post = (Post.find params.permit(:id, :format)[:id]).decorate
	end

	def preview
		render partial:'full_post', locals:{ post: (Post.find params[:id]).decorate, full: false }, layout: false
	end

	def index
		@posts = Post.order('updated_at DESC').all.decorate
		respond_with @posts
	end

	private
		def post_params
			params.require(:post).permit(:short, :long, :format, :link, tag_list:[])
		end

end
