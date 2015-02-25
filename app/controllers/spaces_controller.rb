class SpacesController < ApplicationController
  
  def home
  	if !logged_in?
  		redirect_to '/login'
  	else 
  		@posts = Post.order('updated_at DESC').all.decorate
  		@current_user = current_user.decorate
	  	@relevant_posts = ::PostsService.new(current_user).get_relevant_posts.decorate
  	end
  	
  end

end
