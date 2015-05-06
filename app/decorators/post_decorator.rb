class PostDecorator < Draper::Decorator
	include ActionView::Helpers::TextHelper
	delegate_all

	def tag_list_decorated
		object.project.tag_list.map{ |tag| "<span class='tag_link'>#{tag}</span>" }.join(", ").html_safe
	end

	def comment_text
		if object.comments.any?
			"showing #{ pluralize(post.comments.count, 'comment') }"
		end
	end
end
