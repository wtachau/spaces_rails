json.post do
	json.text        @post.long
	json.first       @post.project.user.firstName
	json.last        @post.project.user.lastName
	json.post_id     @post.id
	json.user_id     @post.project.user.id
	json.project_id  @post.project_id
	json.projectName @post.project.name
	json.usr_img     @post.project.user.image
	json.numComments @post.comments.count
end