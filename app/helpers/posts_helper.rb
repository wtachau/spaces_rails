module PostsHelper

	# Determin which posts are relevant to the user
	def get_relevant_posts
		Post.tagged_with(current_user.tag_list, any: true).order('updated_at DESC')
	end

	# Given the number of follows, return the text to render
	def get_follow_text(follows)
		if follows.count == 0
			""
		elsif follows.count == 1
			" | 1 follow"
		else
			"  |  #{follows.count} follows"
		end
	end

end
