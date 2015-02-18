module PostsHelper

	# Determin which posts are relevant to the user
	def get_relevant_posts
		Post.tagged_with(current_user.tag_list, any: true).order('updated_at DESC')
	end

end
