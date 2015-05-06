module ProjectsHelper
	def follow_text(project, user)
		Follow.exists?(project_id: project.id, user_id: @current_user.id) ? 'following' : 'follow'
	end
end
