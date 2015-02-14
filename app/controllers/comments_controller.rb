class CommentsController < ApplicationController

	def create
		params.permit!
		@comment = Comment.create params[:comment]
		render @comment
	end

end
