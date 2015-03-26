class SpacesController < ApplicationController
	
	def home
		@posts = Post.order('updated_at DESC').all.decorate
		@relevant_posts = ::PostsService.new(current_user).get_relevant_posts.decorate  	
	end

end
