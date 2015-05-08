class NotificationMailer < ActionMailer::Base
	default from: "william.tachau@originate.com"

	def commented_post(comment)
		@comment = comment
		mail to: comment.post.project.user.email, subject: '[Spaces] Your post has a comment!'
	end

	def followed_project_post(post)
		@post = post
		mail to: post.project.follows.map {|follow| follow.user.email }, subject: "[Spaces] A project you're following has a new post!"
	end	

	def followed_project(project, follower)
		@project = project
		@follower = follower
		mail to: project.user.email, subject: '[Spaces] One of your projects has a new follower!'
	end

end