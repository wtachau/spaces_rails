class PostsService

	def initialize(user)
		@user = user
	end

	# Determine which posts are relevant to the user
	def relevant_posts
		followed_posts = Post.followed(@user)
		tagged_posts = Post.tagged(@user)
		followed_posts | tagged_posts
	end

	def relevant_posts_decorated
		PostDecorator.decorate_collection(relevant_posts)
	end

end
