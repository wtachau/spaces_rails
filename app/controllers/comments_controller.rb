class CommentsController < ApplicationController
	include CommentsHelper

	def create
		@comment = (current_user.comments.create comments_params).decorate
		tagged_users = get_tagged_users(@comment)
		render @comment
		Thread.new do
			NotificationMailer.users_tagged(current_user, tagged_users, @comment).deliver_now
			NotificationMailer.commented_post(@comment).deliver_now
		end
	end

	private
		def comments_params
			params.require(:comment).permit(:post_id, :text, :image)
		end

		# Given the comment text, return list of user ids tagged
		def get_tagged_users(comment)
			ids = []
			get_user_ids = lambda { |match| ids.push(userFromTag(match).email) }
			get_users_from(comment.text, get_user_ids)
			ids
		end
end
