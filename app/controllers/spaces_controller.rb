class SpacesController < ApplicationController
	
	def home
		@posts = Post.order('updated_at DESC').all.decorate
		@relevant_posts = PostsService.new(current_user).relevant_posts_decorated
		@projects = Project.all.order('updated_at DESC')
		@new_project = Project.new
		@new_post = Post.new
	end

end
