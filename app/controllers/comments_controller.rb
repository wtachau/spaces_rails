class CommentsController < ApplicationController

	def create
		@comment = current_user.comments.create comments_params
		render @comment.decorate
	end

	private
		def comments_params
			params.require(:comment).permit(:post_id, :text, :image)
		end
end
