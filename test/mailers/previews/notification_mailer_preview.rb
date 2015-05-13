# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
	def sample_comment_preview
		NotificationMailer.commented_post(Comment.first)
	end

	def sample_followed_project_preview
		NotificationMailer.followed_project_post(Post.first)
	end

	def sample_followed_project
		NotificationMailer.followed_project(Project.first, User.first)
	end

	def sample_users_tagged
		NotificationMailer.users_tagged(User.first, User.all.pluck(:email), Comment.first)
	end
end
