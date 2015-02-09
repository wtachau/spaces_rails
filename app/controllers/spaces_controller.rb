class SpacesController < ApplicationController
  def home
  	@post = Post.new
  	@posts = Post.all
  end

  def login
  end
end
