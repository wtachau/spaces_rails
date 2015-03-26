class PostsService

	def initialize(user)
		@user = user
	end

	# Determine which posts are relevant to the user
	def get_relevant_posts
		followed_posts = Post.where(id:Follow.where(user_id:@user).pluck(:post_id))
		tagged_posts = Post.tagged_with(@user.tag_list, any: true).order('updated_at DESC')
		# fixme: should do a union here
		followed_posts
	end

end