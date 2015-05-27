json.text @post.long
json.first @current_user.firstName
json.last @current_user.lastName
json.uid @current_user.user_id
json.pid @post.project_id
json.projectName @post.project.name
json.img @current_user.image
json.numComments @post.comments.count
