class ProjectsController < ApplicationController
  
	def create
		@project = current_user.projects.create project_params
		render @project.decorate
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

	def main_display
		render partial:'full_project', locals: project_dict_from_params
	end

	def description
		render partial: 'description', locals: project_dict_from_params
	end

	def posts
		render partial: 'posts', locals: project_dict_from_params
	end

	def following
		render partial: 'following', locals: project_dict_from_params
	end

	private
		def project_params
			params.require(:project).permit(:short, :name, :link, tag_list:[])
		end

		def project_dict_from_params
			{ project: (Project.find params[:id]).decorate }
		end

end
