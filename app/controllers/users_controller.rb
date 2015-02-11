class UsersController < ApplicationController
  def create
  	user = User.find_by(email: params[:emails]["0"][:value])
  	if !user
  		# Strip trailing "?sz=50" from Google Plus image URL
  		image_url = params[:image][:url]
  		image_url = image_url[0..image_url.index('?') - 1]

  		user = User.create(first_name:params[:name][:givenName], 
  						last_name:params[:name][:familyName], 
  						email:params[:emails]["0"][:value], 
  						image:image_url)
  	end
	log_in user
  	render text: "success"
  end

  def update
  	params.permit!
  	current_user.update_attributes params[:user]
  	render json: current_user
  end

  def update_form
    render partial:'form'
  end
end