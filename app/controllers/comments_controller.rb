require "benchmark"

class CommentsController < ApplicationController

	def create
		@comment = current_user.comments.create comments_params
		render @comment.decorate	
		Thread.new do
			NotificationMailer.commented_post(@comment).deliver_now
		end
	end

	private
		def comments_params
			params.require(:comment).permit(:post_id, :text, :image)
		end
end
