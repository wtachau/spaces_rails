class SpacesController < ApplicationController
  def home
  	@post = Post.new
  	@posts = Post.order('updated_at DESC').all
  end

  def login
  end
end
