class SpacesController < ApplicationController
	
	def home
		@posts = Post.order('updated_at DESC').all.decorate
		@relevant_posts = PostsService.new(current_user).relevant_posts_decorated

		# If link includes specific project or post to display
		if defined?(params[:item]) && defined?(params[:id]) then
			if params[:item] == "project" then
				@selected_project = Project.find_by(id: params[:id]).decorate
			elsif params[:item] == "post" then
				@selected_post = Post.find_by(id: params[:id]).decorate
			end
		end
		@projects = Project.all.order('updated_at DESC')
		@new_project = Project.new
		@new_post = Post.new
	end

end
