class FollowService

	def initialize(project_id, user)
		@project_id = project_id
		@user = user
	end

	def follow_clicked
		if follow = Follow.where(project_id: @project_id, user_id:@user.id).first
			Follow.delete follow
			return 'follow'
		else 
			@user.follows.create project_id: @project_id
			return 'following'
		end
	end

end