class PostDecorator < Draper::Decorator
	include ActionView::Helpers::TextHelper
	delegate_all

	def descriptive_follow_text
		if object.follows.count == 0
			""
		elsif object.follows.count == 1
			" | 1 follow"
		else
			"  |  #{object.follows.count} follows"
		end
	end

	def tag_list_decorated
		object.tag_list.map{ |tag| "<span class='tag_link'>#{tag}</span>" }.join(", ").html_safe
	end

	def comment_text
		if object.comments.any?
			"showing #{ pluralize(post.comments.count, 'comment') }"
		end
	end
end
