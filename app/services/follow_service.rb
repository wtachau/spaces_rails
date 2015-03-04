class FollowService

	def initialize(post_id, user)
		@post_id = post_id
		@user = user
	end

	def follow_clicked
		if follow = Follow.where(post_id: @post_id, user_id:@user.id).first
			Follow.delete follow
			return 'follow'
		else 
			@user.follows.create post_id: @post_id
			return 'following'
		end
	end

end