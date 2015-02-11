class SpacesController < ApplicationController
  
  def home
  	if !logged_in?
  		redirect_to '/login'
  	else 
  		@posts = Post.order('updated_at DESC').all
	  	@relevant_posts = get_relevant_posts
  	end
  	
  end

end
