class CommentsController < ApplicationController

	def create
		params.permit!
		@comment = current_user.comments.create params[:comment]
		render @comment
	end

end
