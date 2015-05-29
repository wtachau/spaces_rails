json.post do
	json.text        	post.long
	json.random_id		"47"
	json.ticket_id		"99"
	json.num_comments 	post.comments.count
	json.id     		post.id
end

json.user do
	json.first     	post.project.user.firstName
	json.last      	post.project.user.lastName
	json.id 	   	post.project.user.id
	json.img   		post.project.user.image
end

json.project do
	
	json.id 	post.project_id
	json.name 	post.project.name
end