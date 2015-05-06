class ProjectsController < ApplicationController
  
	def create
		@project = current_user.projects.create project_params
		render json: { success: true } #@project.decorate # need decorator
	end

	def new
		render partial:'form'
	end

	def follow 
		params.permit :id
		project_id = params[:id]
		result = FollowService.new(project_id, current_user).follow_clicked
		num_follows = (Project.find project_id).decorate.descriptive_follow_text

		render json: { result: result, project: project_id, num_follows: num_follows }
	end

	private
		def project_params
			params.require(:project).permit(:short, :name, :link, tag_list:[])
		end

end
