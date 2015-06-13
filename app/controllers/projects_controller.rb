class ProjectsController < ApplicationController
  
	def create
		@project = current_user.projects.create project_params
		render json: @project.decorate, serializer: ProjectSerializer
	end

	def show
		@project = Project.find params.permit(:id)[:id]
		render json: @project.decorate, serializer: ProjectSerializer
	end

	def index
		@projects = Project.order('updated_at DESC').all.decorate
		render json: @projects, each_serializer: ProjectSerializer
	end

	private
		def project_params
			params.permit(:info, :name, :link, :problem, :solution, :github, :dropbox)
		end

end
