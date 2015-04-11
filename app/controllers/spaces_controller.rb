class SpacesController < ApplicationController
	
	def home
		@posts = Post.order('updated_at DESC').all.decorate
		@relevant_posts = PostsService.new(current_user).relevant_posts_decorated
	end

end
