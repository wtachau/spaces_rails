module PostsHelper

	def follow_text(post, user)
		Follow.exists?(post_id: post.id, user_id: @current_user.id) ? 'following' : 'follow'
	end
end