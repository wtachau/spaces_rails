json.key_format! camelize: :lower
json.post do
	json.text        	post.long
	json.num_comments 	post.comments.count
	json.id     		post.id
end

json.user do
	json.first_name		post.project.user.firstName
	json.last_name 		post.project.user.lastName
	json.id 	   		post.project.user.id
	json.img   			post.project.user.image
end

json.project do
	json.id 			post.project_id
	json.name 			post.project.name
	json.info			post.project.info
	json.problem 		post.project.problem
	json.solution 		post.project.solution
	json.github			post.project.github
	json.dropbox		post.project.dropbox
end