json.array! @projects do |project|
	json.key_format! camelize: :lower
	json.user do
		json.first_name		project.user.firstName
		json.last_name 		project.user.lastName
		json.id 	   		project.user.id
		json.img   			project.user.image
	end

	json.project do
		json.id 			project.id
		json.name 			project.name
		json.info			project.info
		json.problem 		project.problem
		json.solution 		project.solution
		json.github			project.github
		json.dropbox		project.dropbox
		json.num_comments 	project.comments.count
		json.tag_list		project.tag_list
	end
end