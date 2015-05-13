class CommentDecorator < Draper::Decorator
	include ActionView::Helpers::TextHelper
	include CommentsHelper
	delegate_all

	def parsed_text
		# First detect and replace links with anchor 
		text_with_link = auto_link(object.text, :html => { :target => '_blank' })
		# with every instance of @name, replace with <span id=user>name</span
		get_user_span = lambda { |match| match.gsub(match, userSpan(match)) }
		get_users_from(text_with_link.to_str, get_user_span).html_safe
	end

	# Given @FirstLast, return html for that user span link
	def userSpan(tag)
		user = userFromTag(tag)
		if user
			"<span class='username_link user_tag' user_id=#{user.id}> @#{user.first_name}#{user.last_name}</span> "
		end
	end

	def image_url
		h.attachment_url( object, :image, :fill, 300, 300, format: "jpg")
	end
		
end