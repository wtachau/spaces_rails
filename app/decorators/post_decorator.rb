class PostDecorator < Draper::Decorator
	include ActionView::Helpers::TextHelper
	delegate_all

	def comment_text
		if object.comments.any?
			"showing #{ pluralize(post.comments.count, 'comment') }"
		end
	end
end
