class UsersController < ApplicationController

	skip_before_filter :verify_logged_in, only: [:create]

	def create
		user = User.find_by(email: params[:emails]["0"][:value])
		unless user
			user = User.create params_from_google
		end
		log_in user
		render text: "success"
	end

	def user
		render json: @current_user
	end

	private
		def user_params
			params.require(:user).permit(:bio, :job, tag_list:[])
		end

		def params_from_google
			{ first_name: params[:name][:givenName], 
				last_name: params[:name][:familyName], 
				email: params[:emails]["0"][:value], 
				image: image_url(params[:image][:url]) }
		end

		# Strip trailing "?sz=50" from Google Plus image URL
		def image_url(url)
			return url[0..url.index('?') - 1]
		end
end
